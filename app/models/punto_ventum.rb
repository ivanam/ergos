class PuntoVentum < ApplicationRecord
  belongs_to :concesionaria, :foreign_key => 'concesionaria_id', :class_name => 'Concesionarium'

  validates :concesionaria_id, :presence => { :message => "Debe completar la concesionaria donde pertenece el punto de venta" }
  validates :nombre, :presence => { :message => "Debe completar el nombre del P. Venta" }
  validates :domicilio, :presence => { :message => "Debe completar el  campo domicilio" }
end
