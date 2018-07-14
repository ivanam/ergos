class ObjetivoMensual < ApplicationRecord
	belongs_to :punto_venta, :class_name => 'PuntoVentum', :foreign_key => 'punto_venta_id'
  belongs_to :vendedor, optional: true
	belongs_to :user, optional: true
  belongs_to :tipo_objetivo, optional: true
  #validaciones de campos para la creacioón de objetivos mensuales
  validates :mes, :presence => { :message => "Debe completar el campo Fecha de creacion" }
  validates :anio, :presence => { :message => "Debe completar el campo Fecha de creacion" }
	validates :punto_venta_id, :presence => { :message => "Debe completar el campo Punto de venta" }
	validates :tipo_objetivo_id, :presence => { :message => "Debe completar el campo Tipo de Objetivo Mensual" } 

	#valida las cantidades ingresadas tanto para los vendedores como para los puntos de venta
  validate :validarCantidades
  #valida las cantidades del tipo de objetivo CSI, ya que este puede ser mayor al del punto de venta y no  se comporta
  #igual a los demas objetivos
  validate :validarCantidadCsi

  validate :validarCSI

  #validad si el vendedor esta activo, sino tiene fecha de baja
  validate :vendedor_activo

  #validate :validar_csi, if self.tipo_objetivo.to_s == "CSI"
  #validaciones de unicidad para el mes y el punto de venta en la creacion de objetivos
  validates_uniqueness_of :mes, scope: [:punto_venta_id, :vendedor_id, :tipo_objetivo_id, :csi_real] , :message=>"Ya posee un tipo de objetivo para ese vendedor para ese mes", conditions: -> {where(csi_real:nil, vendedor_id: "is not null")}
  validates_uniqueness_of :mes, scope: [:punto_venta_id,  :vendedor_id,:tipo_objetivo_id ] , :message=>"Ya posee un tipo de objetivo para ese punto de venta para ese mes", conditions: -> {where(vendedor_id:nil)}


  def vendedor_activo
    #No permite cargar objetivos mensuales a un vendedor dado de baja
    if !self.vendedor.nil? and self.vendedor.baja
      errors.add(:base, "El vendedor se encuentra de baja")
    end
  end

  #Devuelve el total de objetivos mensuales asignados a un vendedor en un determinado anio y mes
  #Parametros: Anio, mes y vendedor
  def self.objetivo_total_v(anio,mes,v)
    total = 0
    if v.nil?
      vendedor_id = 0
    else
      vendedor_id = v.id
    end
    ObjetivoMensual.where(anio: anio, mes: mes, vendedor_id: vendedor_id).each do |o_m|
      total = total + o_m.cantidad_propuesta.to_i
    end
    return total
  end

  #Devuelve el total de objetivos mensuales de un determinado tipo asignados a un vendedor en un determinado anio y mes
  #Parametros: Anio, mes y vendedor
  def self.objetivo_v(anio,mes,v, ob)
    total = 0
    if v.nil?
      vendedor_id = 0
    else
      vendedor_id = v.id
    end
    ObjetivoMensual.where(anio: anio, mes: mes, vendedor_id: vendedor_id, tipo_objetivo_id: ob).each do |o_m|
      total = total + o_m.cantidad_propuesta.to_i
    end
    return total
  end

  #Devuelve el total de objetivos mensuales de un determinado tipo asignados a un vendedor en un determinado anio y mes
  #Parametros: Anio, mes y vendedor
  def self.objetivo_op(anio,mes,v, ob)
    total = 0
    if v.nil?
      vendedor_id = 0
    else
      vendedor_id = v.id
    end
    ObjetivoMensual.where(anio: anio, mes: mes, vendedor_id: vendedor_id, tipo_objetivo_id: ob).each do |o_m|
      total = total + o_m.cantidad_propuesta.to_i
    end
    return total
  end

  #Devuelve el total de objetivos mensuales de un determinado tipo asignados a un vendedor en un determinado anio y mes
  #Parametros: Anio, mes y vendedor
  def self.objetivo_pm(anio,mes,v, ob)
    total = 0
    if v.nil?
      vendedor_id = 0
    else
      vendedor_id = v.id
    end
    ObjetivoMensual.where(anio: anio, mes: mes, vendedor_id: vendedor_id, tipo_objetivo_id: ob).each do |o_m|
      total = total + o_m.cantidad_propuesta.to_i
    end
    return total
  end

  #Devuelve el total de objetivos mensuales de un determinado tipo asignados a un vendedor en un determinado anio y mes
  #Parametros: Anio, mes y vendedor
   def self.objetivo_pm_csi_real(anio,mes,v, ob)
    total = 0
    if v.nil?
      vendedor_id = 0
    else
      vendedor_id = v.id
    end
    ObjetivoMensual.where(anio: anio, mes: mes, vendedor_id: vendedor_id, tipo_objetivo_id: ob).each do |o_m|
      total = total + o_m.csi_real.to_i
    end
    return total
  end

  
  def self.proyeccion(anio, mes, v, ob)
    # Metodo de clase que devuelve el valor de la proyeccion mensual para un Objetivo Mensual asignado a un vendedor
    # en un determinado mes y anio
    # Parametros: Anio, Mes, Vendedor, Tipo de Objetivo Mensual
    total_ventas_arbitrario = ObjetivoMensual.objetivo_v(anio, mes, v, 5)
    ventas_promedio = CargaDiarium.total_trimestral(anio, mes, v, 5) / 3
    numerador = CargaDiarium.total_trimestral(anio, mes, v, ob) / 3
    denominador = (ventas_promedio == 0) ? 1 : ventas_promedio
    porcentaje = numerador / denominador * 100
    return total_ventas_arbitrario * porcentaje / 100
  end

  def self.total_objetivos_punto_venta(anio, mes, v, ob)
    #calculo para el objetivo para ese mes y ese tipo de objetivo
     total = 0
    if v.nil?
      punto_venta_id = 0
    else
      punto_venta_id = v.punto_venta_id
    end
    objetivo_mensual = ObjetivoMensual.find_by(anio: anio, mes: mes, punto_venta_id: punto_venta_id, tipo_objetivo_id: ob)
    (objetivo_mensual != nil) ? objetivo_mensual.cantidad_propuesta.to_i : 0
  end

  def self.asignado_o_proyeccion(anio, mes, v, ob)
    # Metodo de clase que devuelve el valor asignado a un Objetivo Mensual de un vendedor en caso de que exista 
    # o el valor correspondiente a la proyeccion mensual en caso contrario
    total_asignado = ObjetivoMensual.objetivo_v(anio, mes, v, ob)
    if total_asignado != 0
      return total_asignado
    else
      return ObjetivoMensual.proyeccion(anio, mes, v, ob)
    end
  end

  def validarCantidades
     #validaciones entre los cargado para el punto de venta y lo que se quiere cargar para el 
     #vendedor, las validaciones que estan en este metodo fueron las conversadas con el cliente, ya que no se encuentran documentadas en ningun lado
     # la suma de la cantidad  de x objetivo no puede ser mayor al total del PV al cual pertenece
     # la cantidad para el vendedor y el objetivo no puede superar al del PV
     # no puede agregarle una cantidad sin previamente agregarle  objetivos al PV
  	descpOb = TipoObjetivo.where(:id => self.tipo_objetivo_id).first
    @obMen = ObjetivoMensual.where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio).where(vendedor_id: nil).first
    @obMenSelf = ObjetivoMensual.where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio).where(vendedor_id: nil).where(:id => self.id)
    @obmPv = ObjetivoMensual.select("sum(cantidad_propuesta) as cantidadPV", "id", "cantidad_propuesta", "punto_venta_id").where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio).where(vendedor_id: nil).group("id").first # Performs a COUNT(id)
    @obmVend = ObjetivoMensual.select("sum(cantidad_propuesta) as cantidadVend", "id", "cantidad_propuesta", "vendedor_id").where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio).where.not(vendedor_id: nil).where.not(id: self.id)
    if ((@obmVend != nil) and (@obmPv != nil))
      @obResto =  @obmPv.cantidadPV.to_i -  @obmVend.sum(:cantidad_propuesta).to_i
    elsif (@obmPv != nil)
      @obResto =  @obmPv.cantidadPV.to_i
    end 
    if ((@obMen != nil)  && (descpOb.descripcion != "CSI") && (!self.vendedor_id.nil?))
      if (@obmPv.cantidad_propuesta.to_i != nil)
         if (@obmPv.cantidadPV < self.cantidad_propuesta.to_i)
            errors.add(:base, 'No puede asignarle un numero de venta mayor al vendedor que al punto de venta')
         elsif (self.cantidad_propuesta.to_i > @obResto)
            errors.add(:base, 'El valor del objetivo para el vendedor supera al mensual para el punto de venta, el valor esperado debe ser menor o igual a: '+@obResto.to_s+'')
         end
      end
    end
    if !descpOb.nil?
      if (descpOb.descripcion != "CSI")
        if ((@obMen == nil) and (self.vendedor_id != nil))
          errors.add(:base,'Primero debe crear un objetivo mensual para el punto de venta seleccionado')
        end
      end
    end
  end


  def validarCSI
     # valida que la cantidad ingresada al campo CSI real sea solo para un vendedor
     # validad que no se cree uno nuevo sino que se edite el mismo que ya posee
    @obMen = ObjetivoMensual.where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio, :csi_real=> self.csi_real).where(vendedor_id: nil).first
    if(@obMen != nil)
       if(self.tipo_objetivo_id == 3 && self.csi_real != nil && self.punto_venta_id != nil && self.vendedor_id == nil)
        errors.add(:base,'El CSI Real es por Vendedor no se genera para el Punto de Venta')
      end
       if(@obMen.csi_real != nil && @obMen.vendedor_id == self.vendedor_id)
        errors.add(:base,'El vendedor ya tiene un CSI real asignado, se debe editar y no crear uno nuevo')
       end 
    end

  end

  def validarCantidadCsi
    # validad que no se cree uno nuevo sino que se edite el mismo que ya posee
    if(self.tipo_objetivo_id == 3 && self.csi_real != nil && self.punto_venta_id != nil && self.vendedor_id == nil)
      errors.add(:base,'Debe completar el campo Cantidad ya que el CSI real es para un vendedor')
    end
    if (self.tipo_objetivo_id != 3 && self.cantidad_propuesta == nil)
       errors.add(:base,'Debe completar el campo Cantidad') 
    end
    if (self.tipo_objetivo_id != 3 && self.csi_real != nil)
       errors.add(:base,'El campo CSI real es para los vendedores y para los objetivos de Satisfación al Cliente') 
    end
  end 

end



