class PuntoVentum < ApplicationRecord
  belongs_to :concesionaria, :foreign_key => 'concesionaria_id', :class_name => 'Concesionarium'
  has_many :objetivo_semanal
  has_many :vendedors, :foreign_key => 'punto_venta_id', :class_name => 'Vendedor'


  validates :concesionaria_id, :presence => { :message => "Debe completar la concesionaria donde pertenece el punto de venta" }
  validates :nombre, :presence => { :message => "Debe completar el nombre del P. Venta" }
  validates :domicilio, :presence => { :message => "Debe completar el  campo domicilio" }


	def to_s
		"#{self.nombre}"
	end

end