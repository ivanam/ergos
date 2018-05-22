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
		fecha_hasta = Date.new(anio,mes).end_of_month
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



	def self.carga_total_ob_mes(anio,mes,v,ob)
		total = 0
		fecha_desde = Date.new(anio,mes,1)
		fecha_hasta = Date.new(anio,mes).end_of_month #Si el mes tiene menos de 30
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

		
	def self.carga_total_ob_mes_op(anio,mes,v,ob)
		total = 0
		fecha_desde = Date.new(anio,mes,1)
		fecha_hasta = Date.new(anio,mes).end_of_month #Si el mes tiene menos de 30
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

	def self.carga_total_ob_mes_pm(anio,mes,v,ob)
		total = 0
		fecha_desde = Date.new(anio,mes,1)
		fecha_hasta = Date.new(anio,mes).end_of_month #Si el mes tiene menos de 30
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

	def self.carga_total_ob_mes_v(anio,mes,v,ob)
		total = 0
		fecha_desde = Date.new(anio,mes,1)
		fecha_hasta = Date.new(anio,mes).end_of_month #Si el mes tiene menos de 30
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

	def self.carga_sem_ob_vendedor(anio,mes,v,sem,ob)
		total = 0
		fecha_desde = Date.new(anio,mes,1)
		fecha_hasta = Date.new(anio,mes).end_of_month #Si el mes tiene menos de 30
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

	def self.carga_total_por_equipo(anio, mes, current_user, ob)
		total = 0
		fecha_desde = Date.new(anio,mes,1)
		fecha_hasta = Date.new(anio,mes,31)
		punto_venta_id = 0
		if current_user.has_role? :vendedor
			vendedor = Vendedor.where(persona_id: current_user.persona_id).first
			punto_venta_id = vendedor.punto_venta_id
		else
			if current_user.has_role? :punto_venta
				punto_venta_id = current_user.punto_venta_id
			end
		end
    	vendedor_ids = Vendedor.where(punto_venta_id: punto_venta_id).map(&:id)
    	CargaDiarium.where('fecha >= "'+fecha_desde.to_s+'" and fecha <= "'+fecha_hasta.to_s+'"' ).where(vendedor_id: vendedor_ids, tipo_objetivo_id: ob).each do |c_d|
			total = total + c_d.cantidad
		end
    	return total
	end

	  def self.diaSemana(fecha)
	  	
	  	if fecha.strftime("%A") == "Monday"
	  		dia = "L"
	  	elsif fecha.strftime("%A") == "Tuesday"
	  		dia = "Ma"
	  	elsif fecha.strftime("%A") == "Wednesday"
	  		dia = "Mi"
    	elsif fecha.strftime("%A") == "Thursday"
    		dia = "J"
    	elsif fecha.strftime("%A") == "Friday"
    		dia = "V"
    	elsif fecha.strftime("%A") == "Saturday"
    		dia = "S"
    	elsif fecha.strftime("%A") == "Sunday"
    		dia = "D"
    	end
    return dia
  end

  	def self.calcularSemana(anio,mes,dia)
  		fecha = Date.new(anio,mes,dia)
  		case fecha.day
  		when (1..7)
  			semana = 1
  		when (8..14)
  			semana = 2
  		when (15..21)
  			semana = 3
  		when (22..28)
  			semana = 4
  		when (29..31)
  			semana=5
  		else 
  			semana=5
  		end
  	return semana
  	end

  	def self.cargaVendedorporDia(anio,mes,vendedor,ob,diaNombre, dias)
  			cantidad = nil
  			dias.each do |diasNom|
		  		fecha = Date.new(anio, mes, diasNom)
		  		
			  	if self.diaSemana(fecha) == diaNombre
			  	 	 
				  	 if CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => ob, :fecha => fecha ).first != nil
				  	 	@cantidad = CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => ob, :fecha => fecha ).first.cantidad
				  	 else
				  	 	
				  	 	if EstadoPersona.where(:persona_id => vendedor, :fecha_inicio => fecha.to_s ).first != nil
				  	 		
				  	 		estado_id = EstadoPersona.where(:persona_id => vendedor, :fecha_inicio => fecha.to_s ).first.estado_id
				  	 		@cantidad = Estado.where(:id => estado_id).first.nombre
				  	 	else
				  	 		@cantidad = 0
				  	 	end
				  	 end
				end
			end
			return @cantidad

  	end


  	def self.sumaCantSemVenOb(anio,mes,vendedor,ob,dias)
  			
  			@cantidad = 0
  			dias.each do |diasNom|
		  		fecha = Date.new(anio, mes, diasNom)	 
			  	 if CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => ob, :fecha => fecha ).first != nil
			  	 	@cantidad += CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => ob, :fecha => fecha ).first.cantidad
			  	 end
			 end
			return @cantidad

  	end


  	def self.sumaCantSem(anio,mes,vendedores,ob,dias)
  			
  		@cantidad = 0
  		vendedores.each do |vendedor|
  			dias.each do |diasNom|
		  		fecha = Date.new(anio, mes, diasNom)	 
			  	 if CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => ob, :fecha => fecha ).first != nil
			  	 	@cantidad += CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => ob, :fecha => fecha ).first.cantidad
			  	 end
			 end
		end
		return @cantidad
  	end

  	 def self.cargaVendedoresPorDia(anio,mes,vendedores,ob,diaNombre, dias)
  			@cantidad = 0
  			dias.each do |diasNom|
  				vendedores.each do |vendedor|
		  		fecha = Date.new(anio, mes, diasNom)
		  		
			  	if self.diaSemana(fecha) == diaNombre
			  	 	 
				  	 if CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => ob, :fecha => fecha ).first != nil
				  	 	@cantidad += CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => ob, :fecha => fecha ).first.cantidad
				  	 
				  	 end
				end
			end
			end
			return @cantidad

  	end
end

