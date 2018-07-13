class Concesionarium < ApplicationRecord
	belongs_to :user, optional: true
	has_many :persona_concesionaria, :foreign_key => 'concesionaria_id', :class_name => 'PersonaConcesionarium'
	has_many :personas, :through => :persona_concesionaria 

	has_many :puntos_venta, :foreign_key => 'concesionaria_id', :class_name => 'PuntoVentum'

	has_attached_file :logo, styles: { medium: "300x325>", thumb: "100x100>" }, default_url: "/assets/:style/missing_concesionaria.png"
	validates_attachment_content_type :logo, content_type: /\Aimage/
	validates_attachment :logo, content_type: { content_type: ['image/jpeg', 'image/png', 'image/jpg'] } 
	validates_attachment_size :logo, less_than_or_equal_to: 4.megabytes

	validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }

	validates :cantPv , :presence => { :message => "Debe completar la cantidad de Puntos de Venta" }
	validates :cantVend , :presence => { :message => "Debe completar la cantidad de PVendedores" }
	validates :fin_jornada , :presence => { :message => "Debe completar el campo Horario Fin de Jornada" }

    validates :cantPv, numericality: { only_integer: true, :message => "El campo Cantidad de Puntos de venta debe ser un valor entero"}

    validates :cantVend, numericality: { only_integer: true, :message => "El campo Cantidad de Vendedores debe ser un valor entero"}

	accepts_nested_attributes_for :persona_concesionaria, allow_destroy: true

	validate :control_punto_venta
	validate :control_vendedores
	validates :nombre, uniqueness: {message: "Ya existe una concesionaria con ese nombre"}, if: :debe_validar_nombre?

	def to_s
		"#{self.nombre}"
	end

	def control_punto_venta
		if (self.cantPv.to_i < self.puntos_venta.where(baja: false).count.to_i)
          errors.add(:base, "Debe eliminar puntos de venta para poder editar")
        end
	end

	def debe_validar_nombre?
		conCant = Concesionarium.where(:nombre => self.nombre).where.not(id: self.id).first
		return (new_record?) && (conCant  != nil) && (fecha_baja == nil)
	end

	def control_vendedores
		cant_vendedores = 0
		self.puntos_venta.where(baja: false).each do |pv|
			cant_vendedores = cant_vendedores + pv.vendedors.where('baja is null or baja = false').count
		end
		if (self.cantVend.to_i < cant_vendedores)
          errors.add(:base, "Debe eliminar vendedores para poder editar")
        end
	end

	def dar_baja(fecha)
    self.update(fecha_baja: fecha, baja: true)
    self.puntos_venta.where(baja: false).each do |pv|
      pv.dar_baja(fecha)
    end
    PersonaConcesionarium.where(concesionaria_id: self.id). each do |pc|
      pc.destroy
    end
    User.where(concesionaria_id: self.id).each do |u|
      u.update(concesionaria_id: nil)
    end
  end
end
