class PuntoVentum < ApplicationRecord
  belongs_to :concesionaria, :foreign_key => 'concesionaria_id', :class_name => 'Concesionarium'
  has_many :objetivo_semanal
  has_many :vendedors, :foreign_key => 'punto_venta_id', :class_name => 'Vendedor'


  validates :concesionaria_id, :presence => { :message => "Debe completar la concesionaria donde pertenece el punto de venta" }
  validates :nombre, :presence => { :message => "Debe completar el nombre del P. Venta" }
  validates :domicilio, :presence => { :message => "Debe completar el  campo domicilio" }

  validate :validarCantPV


	def to_s
		"#{self.nombre}"
	end

    def validarCantPV
     cantPv = Concesionarium.where(:id => self.concesionaria_id).first.cantPv
     cantPvconc = PuntoVentum.where(:concesionaria_id => self.concesionaria_id).count
     if (cantPv <= cantPvconc)
      	errors.add(:base, "No puede generar mas puntos de venta para esta concesionaria")
     end
    end 

end