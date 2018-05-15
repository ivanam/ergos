class CargaDiarium < ApplicationRecord
	belongs_to :tipo_objetivo
	belongs_to :user, :foreign_key => 'vendedor_id'

	validates :fecha, :presence => { :message => "Debe completar el campo Fecha" }
	validates :cantidad, :presence => { :message => "Debe completar el campo Cantidad" }
	validates :cantidad, numericality: { only_integer: true, :message => "El campo Cantidad debe ser un valor entero"}
	validates :tipo_objetivo_id, :presence => { :message => "Debe completar el campo Tipo de Objetivo" }
	validates :vendedor_id, :presence => { :message => "Debe completar el campo Vendedor" }

	def self.carga_total_mes_v(anio,mes,v)
		total = 0
		fecha_desde = Date.new(anio,mes,1)
		fecha_hasta = Date.new(anio,mes,31)
		if v.nil?
			vendedor_id = 0
		else
			vendedor_id = v.id
		end
		CargaDiarium.where('fecha >= "'+fecha_desde.to_s+'" and fecha <= "'+fecha_hasta.to_s+'"' ).where(vendedor_id: vendedor_id).each do |c_d|
			total = total + c_d.cantidad
		end
		return total
	end

	def self.carga_total_ob_mes_v(anio,mes,v,ob)
		total = 0
		fecha_desde = Date.new(anio,mes,1)
		fecha_hasta = Date.new(anio,mes,31)
		if v.nil?
			vendedor_id = 0
		else
			vendedor_id = v.id
		end
		CargaDiarium.where('fecha >= "'+fecha_desde.to_s+'" and fecha <= "'+fecha_hasta.to_s+'"' ).where(vendedor_id: vendedor_id, tipo_objetivo_id: ob).each do |c_d|
			total = total + c_d.cantidad
		end
		return total
	end

end

