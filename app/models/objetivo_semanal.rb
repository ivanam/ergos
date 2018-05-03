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
	validates :punto_venta_id, :presence => { :message => "Debe completar el campo Punto de venta" }
	validates :vendedor_id, :presence => { :message => "Debe completar el campo Vendedor" }
	validates :tipo_objetivo_id, :presence => { :message => "Debe completar el campo tipo de objetivo semanal" }
	#validates :objetivo_mensual_id, :presence => { :message => "Debe completar el campo Objetivo Mensual" }

end


def to_s
    "#{self.descipcion}"
end
