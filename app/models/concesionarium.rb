class Concesionarium < ApplicationRecord
	belongs_to :user
	has_many :persona_concesionaria, :foreign_key => 'concesionaria_id', :class_name => 'PersonaConcesionarium'
	has_many :personas, :through => :persona_concesionaria 

	validates :nombre, :presence => { :message => "Debe completar el campo Nombre" }

	accepts_nested_attributes_for :persona_concesionaria, allow_destroy: true

	def to_s
		"#{self.nombre}"
	end
end
