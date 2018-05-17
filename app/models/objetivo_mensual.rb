class ObjetivoMensual < ApplicationRecord
	belongs_to :punto_venta, :class_name => 'PuntoVentum', :foreign_key => 'punto_venta_id'
	#belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'

  validates :mes, :presence => { :message => "Debe completar el campo Fecha de creacion" }
  validates :anio, :presence => { :message => "Debe completar el campo Fecha de creacion" }
	validates :cantidad_propuesta, :presence => { :message => "Debe completar el campo Cantidad" }
	validates :cantidad_propuesta, numericality: { only_integer: true, :message => "El campo Cantidad debe ser un valor entero"}	
	validates :punto_venta_id, :presence => { :message => "Debe completar el campo Punto de venta" }
	#validates :vendedor_id, :presence => { :message => "Debe completar el campo Vendedor" }
	validates :tipo_objetivo_id, :presence => { :message => "Debe completar el campo Objetivo Mensual" } 

	validate :validarCantidades

  #validate :validar_csi, if self.tipo_objetivo.to_s == "CSI"

  validates_uniqueness_of :anio, scope: [:mes, :punto_venta_id, :vendedor_id, :tipo_objetivo_id] , :message=>"Ya posee un tipo de objetivo para ese vendedor para ese mes"

  def self.objetivo_total_v(anio,mes,v)
    total = 0
    if v.nil?
      vendedor_id = 0
    else
      vendedor_id = v.id
    end
    ObjetivoMensual.where(anio: anio, mes: mes, vendedor_id: vendedor_id).each do |o_m|
      total = total + o_m.cantidad_propuesta
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
      total = total + o_m.cantidad_propuesta
    end
    return total
  end


  def validarCantidades
  	descpOb = TipoObjetivo.where(:id => self.tipo_objetivo_id).first
    @obMen = ObjetivoMensual.where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio).where(vendedor_id: nil).first
    @obmPv = ObjetivoMensual.select("sum(cantidad_propuesta) as cantidadPV", "id", "cantidad_propuesta", "punto_venta_id").where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio).where(vendedor_id: nil).group("id").first # Performs a COUNT(id)
    @obmVend = ObjetivoMensual.select("sum(cantidad_propuesta) as cantidadVend", "id", "cantidad_propuesta", "vendedor_id").where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio).where.not(vendedor_id: nil).group("id").first
    if ((@obMen != nil)  && (descpOb.descripcion != "CSI"))
      if (@obmPv.cantidad_propuesta.to_i != nil)
        @obResto =  @obmPv.cantidadPV.to_i - @obmVend.cantidadVend.to_i
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
    
      if ((self.vendedor_id == @obmVend.vendedor_id.to_i))
          errors.add(:base,'Ya existe un Objetivo Mensual para ese mes y año para ese vendedor')
      end 
    end
  end

end



