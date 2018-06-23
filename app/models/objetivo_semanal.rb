class ObjetivoSemanal < ApplicationRecord
	#belongs_to :user
	belongs_to :punto_ventum, :foreign_key => 'punto_venta_id', optional: true
	belongs_to :vendedor, optional: true
	belongs_to :tipo_objetivo, optional: true
	#belongs_to :objetivo_mensual

	validates :fecha_creacion, :presence => { :message => "Debe completar el campo Fecha de creacion" }
	validates :cantidad_propuesta, :presence => { :message => "Debe completar el campo Cantidad" }
	validates :cantidad_propuesta, numericality: { only_integer: true, :message => "El campo Cantidad debe ser un valor entero"}	
	validates :numero_semana, :presence => { :message => "Debe completar el campo Numero de semana" }
	validates :numero_semana, numericality: { only_integer: true, :message => "El campo Numero de semana debe ser un valor entero"}	
	#validates :user_id, :presence => { :message => "Debe completar el campo User" }
	validates :tipo_objetivo_id, :presence => { :message => "Debe completar el campo tipo de objetivo semanal" }
	#validates :objetivo_mensual_id, :presence => { :message => "Debe completar el campo Objetivo Mensual" }
	validates_uniqueness_of :numero_semana, scope: [:punto_venta_id, :vendedor_id, :tipo_objetivo_id] ,  :message=>"Ya posee un tipo de objetivo para ese pv para esa semana" 

    validate :validarCantidadesSem

end


def to_s
    "#{self.descripcion}"
end


def validaVendedor
    if self.punto_venta_id == nil
    	validates :punto_venta_id, :presence => { :message => "Debe completar el campo Punto de venta" }
     else
     	validates :vendedor_id, :presence => { :message => "Debe completar el campo Vendedor" }
    end

end

  def validarCantidadesSem
  	descpOb = TipoObjetivo.where(:id => self.tipo_objetivo_id).first
    @obMen = ObjetivoMensual.where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio).where(vendedor_id: nil).first
    @obsemPv = ObjetivoSemanal.select("sum(cantidad_propuesta) as cantidadPV", "id", "cantidad_propuesta", "punto_venta_id").where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio).where(vendedor_id: nil).group("id").first # Performs a COUNT(id)
    #@obmVend = ObjetivoMensual.select("sum(cantidad_propuesta) as cantidadVend", "id", "cantidad_propuesta", "vendedor_id").where(:punto_venta_id => self.punto_venta_id, :tipo_objetivo_id => self.tipo_objetivo_id, :mes  => self.mes ,:anio=> self.anio).where.not(vendedor_id: nil).group("id").first
    if ((@obMen != nil) && (descpOb.descripcion != 'COMPROMISO DE VENTAS SEMANAL'))
    	@obMenCantProp = @obMen.cantidad_propuesta.to_i
         if (@obMen.cantidad_propuesta.to_i < self.cantidad_propuesta.to_i)
           errors.add(:base, 'EL objetivo semanal no puede superar al objetivo mensual del punto de venta, el valor maximo deberia ser: '+@obMenCantProp.to_s+' repartido en las semanas restantes')
         end
         if (@obsemPv != nil)
    	    @obResto = @obMen.cantidad_propuesta.to_i - self.cantidad_propuesta.to_i
           if (@obResto < self.cantidad_propuesta.to_i)
              errors.add(:base, 'El objetivo para esa semana deberia ser como maximo: '+@obResto.to_s+'')	
           end 
         end
        if (descpOb.id != @obMen.tipo_objetivo_id) 
          errors.add(:base, 'Debe generar primero un Objetivo Mensual')
        end               
    end
    if ((@obMen == nil) && (descpOb.descripcion != 'COMPROMISO DE VENTAS SEMANAL'))
    	    errors.add(:base, 'Debe generar primero un Objetivo Mensual')
    end
    if  ((descpOb.descripcion == 'COMPROMISO DE VENTAS SEMANAL') && (self.vendedor_id == nil))
    	errors.add(:base, 'Los compromisos de venta son para los vendedores, no pueden ser asignados a los Puntos de Venta')
    end


end  