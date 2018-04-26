class Concesionarium < ApplicationRecord

	has_many :persona_concesionaria, :foreign_key => 'persona_id', :class_name => 'PersonaConcesionarium'
	has_many :personas, :through => :persona_concesionaria 
	accepts_nested_attributes_for :persona_concesionaria, allow_destroy: true

	def to_s
		"#{self.nombre}"
	end
end
