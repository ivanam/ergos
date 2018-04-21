class TipoObjetivo < ApplicationRecord

	def to_s
		self.descripcion
	end
end
