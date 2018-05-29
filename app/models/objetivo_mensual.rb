class ObjetivoMensual < ApplicationRecord
	belongs_to :punto_venta, :class_name => 'PuntoVentum', :foreign_key => 'punto_venta_id'
	#belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'

  validates :mes, :presence => { :message => "Debe completar el campo Fecha de creacion" }
  validates :anio, :presence => { :message => "Debe completar el campo Fecha de creacion" }
	validates :punto_venta_id, :presence => { :message => "Debe completar el campo Punto de venta" }
	#validates :vendedor_id, :presence => { :message => "Debe completar el campo Vendedor" }
	validates :tipo_objetivo_id, :presence => { :message => "Debe completar el campo Objetivo Mensual" } 

	validate :validarCantidades

  validate :validarCantidadCsi

  validate :validarCSI


  #validate :validar_csi, if self.tipo_objetivo.to_s == "CSI"

  validates_uniqueness_of :mes, scope: [:mes, :punto_venta_id, :vendedor_id, :tipo_objetivo_id, :csi_real] , :message=>"Ya posee un tipo de objetivo para ese vendedor para ese mes", conditions: -> {where(csi_real:nil)}

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


  def validarCantidades
  	descpOb = TipoObjetivo.where(:id => self.tipo_objetivo_id).first
    @obMen = ObjetivoMensual.where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio).where(vendedor_id: nil).first
    @obmPv = ObjetivoMensual.select("sum(cantidad_propuesta) as cantidadPV", "id", "cantidad_propuesta", "punto_venta_id").where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio).where(vendedor_id: nil).group("id").first # Performs a COUNT(id)
    @obmVend = ObjetivoMensual.select("sum(cantidad_propuesta) as cantidadVend", "id", "cantidad_propuesta", "vendedor_id").where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio).where.not(vendedor_id: nil).group("id").first
    if (@obmVend != nil)
      @obResto =  @obmPv.cantidadPV.to_i - @obmVend.cantidadVend.to_i
    elsif (@obmPv != nil)
      @obResto =  @obmPv.cantidadPV.to_i
    end
    if ((@obMen != nil)  && (descpOb.descripcion != "CSI"))
      if (@obmPv.cantidad_propuesta.to_i != nil)
         if (@obmPv.cantidadPV < self.cantidad_propuesta.to_i)
            errors.add(:base, 'No puede asignarle un numero de venta mayor al vendedor que al punto de venta')
         end
          if (self.cantidad_propuesta.to_i > @obResto)
            errors.add(:base, 'El valor del objetivo para el vendedor supera al mensual de vendedores, el valor esperado debe ser menor o igual a: '+@obResto.to_s+'')
         end
      end
    end
    if (descpOb.descripcion != "CSI")
      if ((@obMen == nil) && (self.vendedor_id != nil))
        errors.add(:base,'Primero debe crear un objetivo mensual para el punto de venta seleccionado')
      end
      
    end
  end


  def validarCSI
    @obMen = ObjetivoMensual.where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio, :csi_real=> self.csi_real).where(vendedor_id: nil).first
    if(@obMen != nil)
       if(self.tipo_objetivo_id == 5 && self.csi_real != nil && self.punto_venta_id != nil && self.vendedor_id == nil)
        errors.add(:base,'El CSI Real es por Vendedor no se genera para el Punto de Venta')
      end
       if(@obMen.csi_real != nil && @obMen.vendedor_id == self.vendedor_id)
        errors.add(:base,'El vendedor ya tiene un CSI real asignado, se debe editar y no crear uno nuevo')
       end 
    end

  end

  def validarCantidadCsi
    if(self.tipo_objetivo_id == 5 && self.csi_real != nil && self.punto_venta_id != nil && self.vendedor_id == nil)
      errors.add(:base,'Debe completar el campo Cantidad ya que el CSI real es para un vendedor')
    end
    if (self.tipo_objetivo_id != 5 && self.cantidad_propuesta == nil)
       errors.add(:base,'Debe completar el campo Cantidad') 
    end
    if (self.tipo_objetivo_id != 5 && self.csi_real != nil)
       errors.add(:base,'El campo CSI real es para los vendedores y para los objetivos de Satisfación al Cliente') 
    end
  end 

end



