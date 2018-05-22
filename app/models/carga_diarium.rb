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

	def self.total_trimestral(anio,mes,v, ob)
	    mes_actual = Date.today.month
        anio = Date.today.year
        primer_mes = mes_actual - 3
        if (primer_mes < 0)
        	primer_mes = 13 + (primer_mes)
            anio -=  1
        end
	    segundo_mes = primer_mes + 1
	    tercer_mes = segundo_mes + 1

	    total_primer_mes = 0
	    total_segundo_mes = 0
	    total_tercer_mes = 0
	    if v.nil?
	      vendedor_id = 0
	    else
	      vendedor_id = v.id
	    end
	    ObjetivoMensual.where(anio: anio, mes: primer_mes, vendedor_id: vendedor_id, tipo_objetivo_id: ob).each do |o_m|
	      total_primer_mes += o_m.cantidad_propuesta
	    end
	    ObjetivoMensual.where(anio: anio, mes: primer_mes, vendedor_id: vendedor_id, tipo_objetivo_id: ob).each do |o_m|
	      total_segundo_mes += o_m.cantidad_propuesta
	    end
	    ObjetivoMensual.where(anio: anio, mes: primer_mes, vendedor_id: vendedor_id, tipo_objetivo_id: ob).each do |o_m|
	      total_tercer_mes += o_m.cantidad_propuesta
	    end
	    return total_primer_mes + total_segundo_mes + total_tercer_mes
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

  	def self.obtenerCompromisoDeVentas(anio,mes,semana)
  		@cantidad=0
  		if semana == 1 
		dias = [1,2,3,4,5,6,7]
		elsif semana == 2 
			dias = [8,9,10,11,12,13,14]
		elsif semana == 3 
			dias = [15,16,17,18,19,20,21]
		elsif semana == 4 
			dias = [22,23,24,25,26,27,28]
		elsif semana == 5 
			dias = [29,30,31]
		else
			dias=[29,30,31]
		end
		dias.each do |diasNom|
			fecha = Date.new(anio, mes, diasNom)
			tipo_objetivo =TipoObjetivo.where(:descripcion => "COMPROMISO DE VENTAS SEMANAL").first.id
  			if ObjetivoSemanal.where(:fecha_creacion =>fecha, :tipo_objetivo => tipo_objetivo).first != nil
  				@cantidad=ObjetivoSemanal.where(:fecha_creacion =>fecha, :tipo_objetivo => tipo_objetivo).first.cantidad_propuesta
  			end
  		end
  		return @cantidad

    end

    def self.obtenerCompromisoDeVentasMensual(anio,mes,vendedor)
    		vid = vendedor.id
    		@cantidad = 0
    		tipo_objetivo =TipoObjetivo.where(:descripcion => "VENTAS").first.id
  			if ObjetivoMensual.where(:mes =>mes, :anio => anio, :tipo_objetivo_id => tipo_objetivo, :vendedor_id => vid).first != nil  				
  				@cantidad=ObjetivoMensual.where(:mes =>mes, :anio => anio, :tipo_objetivo_id => tipo_objetivo, :vendedor_id => vid).first.cantidad_propuesta
  			end

  			return @cantidad

    end

     def self.obtenerCSIVendedor(anio,mes,vendedor)
    		vid = vendedor.id
    		@cantidad = 0
    		tipo_objetivo =TipoObjetivo.where(:descripcion => "CSI").first.id
  			if ObjetivoMensual.where(:mes =>mes, :anio => anio, :tipo_objetivo_id => tipo_objetivo, :vendedor_id => vid).first != nil  				
  				@cantidad=ObjetivoMensual.where(:mes =>mes, :anio => anio, :tipo_objetivo_id => tipo_objetivo, :vendedor_id => vid).first.cantidad_propuesta
  			end

  			return @cantidad

    end


     def self.obtenerCSIEquipo(anio,mes,punto)
    		vid = punto.id
    		@cantidad = 0
    		tipo_objetivo =TipoObjetivo.where(:descripcion => "CSI").first.id
  			if ObjetivoMensual.where(:mes =>mes, :anio => anio, :tipo_objetivo_id => tipo_objetivo, :punto_venta_id => vid).first != nil  				
  				@cantidad=ObjetivoMensual.where(:mes =>mes, :anio => anio, :tipo_objetivo_id => tipo_objetivo, :punto_venta_id => vid).first.cantidad_propuesta
  			end

  			return @cantidad

    end


    def self.SumaVentasMensualVendedor(anio,mes,vendedor)
  			
  			@cantidad = 0
  			dias=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
  			tipo_objetivo =TipoObjetivo.where(:descripcion => "VENTAS").first.id
  			dias.each do |diasNom|
		  		fecha = Date.new(anio, mes, diasNom)	 
			  	 if CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => tipo_objetivo, :fecha => fecha ).first != nil
			  	 	@cantidad += CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => tipo_objetivo, :fecha => fecha ).first.cantidad
			  	 end
			 end
			return @cantidad

  	end


    def self.obtenerReservasEquipo(anio,mes,vendedores)
  			
  			@cantidad = 0
  			dias=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
  			tipo_objetivo =TipoObjetivo.where(:descripcion => "VENTAS").first.id
  			vendedores.each do |vendedor|
	  			dias.each do |diasNom|
			  		fecha = Date.new(anio, mes, diasNom)	 
				  	 if CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => tipo_objetivo, :fecha => fecha ).first != nil
				  	 	@cantidad += CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => tipo_objetivo, :fecha => fecha ).first.cantidad
				  	 end
				 end
			end
			return @cantidad

  	end

  	def self.obtenerVentaPuntoVenta(anio,mes,punto)
  			punto = punto.id
    		@cantidad = 0
    		tipo_objetivo =TipoObjetivo.where(:descripcion => "CSI").first.id
  			if ObjetivoMensual.where(:mes =>mes, :anio => anio, :tipo_objetivo_id => tipo_objetivo, :punto_venta_id => punto).first != nil  				
  				@cantidad=ObjetivoMensual.where(:mes =>mes, :anio => anio, :tipo_objetivo_id => tipo_objetivo, :punto_venta_id => punto).first.cantidad_propuesta
  			end

  			return @cantidad

    end

    def self.calculoDeAvanceEquipo(anio,mes,punto,vendedores)
  		@avance = 0
  		if self.obtenerCSIEquipo(anio,mes,punto) != 0
  			meta = self.obtenerCSIEquipo(anio,mes,punto)
	  		if  self.obtenerReservasEquipo(anio,mes,vendedores) != 0
	  			reservas = self.obtenerReservasEquipo(anio,mes,vendedores)
	  			@avance = reservas * 100 / meta
	  		end
	  	end
  		return @avance
  	end

  	def self.calculoDeAvance(anio,mes,vendedor)
  		@avance = 0
  		if self.obtenerCompromisoDeVentasMensual(anio,mes,vendedor) != 0
  			meta = self.obtenerCompromisoDeVentasMensual(anio,mes,vendedor)
	  		if  self.SumaVentasMensualVendedor(anio,mes,vendedor) != 0
	  			reservas = self.SumaVentasMensualVendedor(anio,mes,vendedor)
	  			@avance = reservas * 100 / meta
	  		end
	  	end
  		return @avance
  	end

end

