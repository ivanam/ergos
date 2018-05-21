class Estado < ApplicationRecord	

	def to_s
		"#{self.descripcion}"
	end
end
