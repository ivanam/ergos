class Persona < ApplicationRecord

	has_many :vendedors 
	belongs_to :tipo_documentos

	validates :numero_documento, presence: true
	validates :nombre, presence: true
	validates :apellido, presence: true
	
end
