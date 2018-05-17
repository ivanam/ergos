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
	validates_uniqueness_of :numero_semana, scope: [:punto_venta_id, :vendedor_id, :tipo_objetivo_id] ,  :message=>"Ya posee un tipo de objetivo para ese vendedor para esa semana" 

end


def to_s
    "#{self.descipcion}"
end


def validaVendedor
    if self.punto_venta_id == nil
    	validates :punto_venta_id, :presence => { :message => "Debe completar el campo Punto de venta" }
     else
     	validates :vendedor_id, :presence => { :message => "Debe completar el campo Vendedor" }
    end

end