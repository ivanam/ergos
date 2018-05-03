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

end
