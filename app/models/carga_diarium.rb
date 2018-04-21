class CargaDiarium < ApplicationRecord
	belongs_to :tipo_objetivo
	belongs_to :vendedor


	validates :fecha, :presence => { :message => "Debe completar el campo Fecha" }
	validates :cantidad, :presence => { :message => "Debe completar el campo Cantidad" }
	validates :cantidad, numericality: { only_integer: true, :message => "El campo Cantidad debe ser un valor entero"}
	validates :tipo_objetivo_id, :presence => { :message => "Debe completar el campo Tipo de Objetivo" }
	validates :vendedor_id, :presence => { :message => "Debe completar el campo Vendedor" }

end

