class PuntoVentum < ApplicationRecord
  belongs_to :concesionaria, :foreign_key => 'concesionaria_id', :class_name => 'Concesionarium'
  has_many :objetivo_semanal
  has_many :vendedors, :foreign_key => 'punto_venta_id', :class_name => 'Vendedor'


  validates :concesionaria_id, :presence => { :message => "Debe completar la concesionaria donde pertenece el punto de venta" }
  validates :nombre, :presence => { :message => "Debe completar el nombre del P. Venta" }
  validates :domicilio, :presence => { :message => "Debe completar el  campo domicilio" }

  validate :validarCantPV, :on => :create
  validate :validar_cantidad_pv

	def to_s
		"#{self.nombre}"
	end

  def validarCantPV     
    self.concesionaria.cantPv.to_i
    cantPvconc = PuntoVentum.where(:concesionaria_id => self.concesionaria_id, baja: false).count
    if (self.concesionaria.cantPv.to_i <= cantPvconc.to_i)
      errors.add(:base, "No puede generar mas puntos de venta para esta concesionaria")
    end
  end 

  def validar_cantidad_pv
    self.concesionaria.cantPv.to_i
    cantPvconc = PuntoVentum.where(:concesionaria_id => self.concesionaria_id, baja: false).count
    if (self.concesionaria.cantPv.to_i < cantPvconc.to_i)
      errors.add(:base, "No puede generar mas puntos de venta para esta concesionaria")
    end
  end 

  def self.sumaObSemanales 

  end

  def dar_baja(fecha)
    self.update(fecha_baja: fecha, baja: true)
    self.vendedors.where('baja is null or baja = false').each do |v|
      v.dar_baja(fecha)
    end
    PersonaPuntoVentum.where(punto_venta_id: self.id). each do |ppv|
      ppv.destroy
    end
    User.where(punto_venta_id: self.id).each do |u|
      u.update(punto_venta_id: nil)
    end
  end


end