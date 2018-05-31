class Concesionarium < ApplicationRecord
	belongs_to :user
	has_many :persona_concesionaria, :foreign_key => 'concesionaria_id', :class_name => 'PersonaConcesionarium'
	has_many :personas, :through => :persona_concesionaria 

	has_many :puntos_venta, :foreign_key => 'concesionaria_id', :class_name => 'PuntoVentum'

	has_attached_file :logo, styles: { medium: "300x325>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :logo, content_type: /\Aimage/
	validates_attachment_file_name :logo, matches: [/png\Z/, /jpe?g\Z/]
	validates_attachment_size :logo, less_than_or_equal_to: 4.megabytes

	validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }

	accepts_nested_attributes_for :persona_concesionaria, allow_destroy: true

	validate :control_punto_venta
	validate :control_vendedores

	def to_s
		"#{self.nombre}"
	end

	def control_punto_venta
		if (self.cantPv.to_i < self.puntos_venta.count.to_i)
          errors.add(:base, "Debe eliminar puntos de venta para poder editar")
        end
	end

	def control_vendedores
		cant_vendedores = 0
		self.puntos_venta.each do |pv|
			cant_vendedores = cant_vendedores + pv.vendedors.count
		end
		if (self.cantVend.to_i < cant_vendedores)
          errors.add(:base, "Debe eliminar vendedores para poder editar")
        end
	end
end
