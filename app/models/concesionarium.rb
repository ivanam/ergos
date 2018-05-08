class Concesionarium < ApplicationRecord
	belongs_to :user
	has_many :persona_concesionaria, :foreign_key => 'concesionaria_id', :class_name => 'PersonaConcesionarium'
	has_many :personas, :through => :persona_concesionaria 

	has_attached_file :logo, styles: { medium: "100x325>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :logo, content_type: /\Aimage/
	validates_attachment_file_name :logo, matches: [/png\Z/, /jpe?g\Z/]
	validates_attachment_size :logo, less_than_or_equal_to: 4.megabytes

	validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }

	accepts_nested_attributes_for :persona_concesionaria, allow_destroy: true

	def to_s
		"#{self.nombre}"
	end
end
