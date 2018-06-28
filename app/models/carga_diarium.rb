class CargaDiarium < ApplicationRecord
	belongs_to :tipo_objetivo
	belongs_to :user, :foreign_key => 'vendedor_id'
	belongs_to :vendedor

	validates :fecha, :presence => { :message => "Debe completar el campo Fecha" }
	validates :cantidad, :presence => { :message => "Debe completar el campo Cantidad" }
	validates :cantidad, numericality: { only_integer: true, :message => "El campo Cantidad debe ser un valor entero"}
	validates :tipo_objetivo_id, :presence => { :message => "Debe completar el campo Tipo de Objetivo" }
	validates :vendedor_id, :presence => { :message => "Debe completar el campo Vendedor" }

	validate :estado_vend

	validate :vendedor_activo

	def estado_vend
		self.vendedor.estado_personas.each do |e_p|
			f_i = e_p.fecha_inicio
			if e_p.fecha_fin == nil
				f_f = Date.new(3000,f_i.month,f_i.day)
			else
				f_f = e_p.fecha_fin
			end
			if self.fecha.to_date >= f_i and self.fecha.to_date <= f_f
				errors.add(:base, "No puede realizar la carga")
				return 0
			end
		end
	end

	def vendedor_activo
		if self.vendedor.baja && (self.fecha >= self.vendedor.fecha_baja)
			errors.add(:base, "El vendedor se encuentra de baja")
		end
	end

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

	def self.porcentaje_conversion_yo(anio,mes,v)
		total = 0
		fecha_desde = Date.new(anio,mes,1)
		fecha_hasta = Date.new(anio,mes).end_of_month #Si el mes tiene menos de 30
		if v.nil?
			vendedor_id = 0
		else
			vendedor_id = v.id
		end
		
		ventas = CargaDiarium.carga_total_ob_mes(anio,mes,v,5)
		oportunidades = CargaDiarium.carga_total_ob_mes(anio,mes,v,7)
		if oportunidades == 0
			oportunidades = 1
		end
		total = ventas.to_f/oportunidades.to_f*100


		return total.to_i
	end

	def self.porcentaje_conversion_equipo(anio, mes, current_user)
		total = 0
		fecha_desde = Date.new(anio,mes,1)
		fecha_hasta = Date.new(anio,mes).end_of_month #Si el mes tiene menos de 30
		
		ventas = CargaDiarium.carga_total_por_equipo(anio,mes,current_user,5)
		oportunidades = CargaDiarium.carga_total_por_equipo(anio,mes,current_user,7)
		if oportunidades == 0
			oportunidades = 1
		end
		total = ventas.to_f/oportunidades.to_f*100


		return total.to_i
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

	def self.carga_total_ob_mes_cre(anio,mes,v,ob)
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
		fecha_hasta = Date.new(anio,mes).end_of_month
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

	def self.total_trimestral(anio, mes, v, ob)
	    mes_actual = mes
        primer_mes = mes_actual - 3
        if (primer_mes < 0)
            primer_mes = 13 + (primer_mes)
        	anio -=  1
        end
        segundo_mes = primer_mes + 1
		tercer_mes = segundo_mes + 1
		total_mes1 = CargaDiarium.carga_total_ob_mes_op(anio, primer_mes, v, ob)
        total_mes2 = CargaDiarium.carga_total_ob_mes_op(anio, segundo_mes, v, ob)
		total_mes3 = CargaDiarium.carga_total_ob_mes_op(anio, tercer_mes, v, ob)
		return total_mes1 + total_mes2 + total_mes3
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
  		 semana = Date.new(anio,mes,dia).week_of_month
  		return semana
  	end
  	def self.obtenerDiasSemanasegunFecha(anio,mes,dia)
  		 semana = Date.new(anio,mes,dia).week_of_month
  		 semana_split = Date.new(anio,mes,dia).week_split
  		 dias = semana_split[semana - 1]
  		 dias.delete(nil)
  		return dias
  	end

  	def self.obtenerDiasSemana(anio,mes,semana)
  		 semana_split = Date.new(anio,mes,1).week_split
  		 dias = semana_split[semana - 1]
  		 dias.delete(nil)
  		return dias
  	end

  	def self.cargaVendedorporDia(anio,mes,vendedor,obj,diaNombre, dias)
  			
  			ob =TipoObjetivo.where(:descripcion => obj).first.id

  			@cantidad = 0
  			dias.each do |diasNom|
		  		fecha = Date.new(anio, mes, diasNom)
		  		
			  	if self.diaSemana(fecha) == diaNombre
			  	 	 
				  	 if CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => ob, :fecha => fecha ).first != nil
				  	 	@cantidad = CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => ob, :fecha => fecha ).first.cantidad
				  	 else
				  	 	if EstadoPersona.where(:vendedor_id => vendedor, :fecha_inicio => fecha.to_s).first != nil
				  	 		
				  	 		estado_id = EstadoPersona.where(:vendedor_id => vendedor, :fecha_inicio => fecha.to_s ).first.estado_id
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
  			tipo_objetivo =TipoObjetivo.where(:descripcion => ob).first.id
  			@cantidad = 0
  			dias.each do |diasNom|
		  		fecha = Date.new(anio, mes, diasNom)	 
			  	 if CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => tipo_objetivo, :fecha => fecha ).first != nil
			  	 	@cantidad += CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => tipo_objetivo, :fecha => fecha ).first.cantidad
			  	 end
			 end
			return @cantidad

  	end


  	def self.sumaCantSem(anio,mes,vendedores,obj,dias)
  		ob =TipoObjetivo.where(:descripcion => obj).first.id
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

  	 def self.cargaVendedoresPorDia(anio,mes,vendedores,obj,diaNombre, dias)
  	 		ob =TipoObjetivo.where(:descripcion => obj).first.id
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

  	def self.obtenerCompromisoDeVentas(anio,mes,semana,vendedor)
  		dias = self.obtenerDiasSemana(anio,mes,semana)
  		@cantidad=0
  		
		vendedorid = vendedor.id
		dias.each do |diasNom|
			tipo_objetivo =TipoObjetivo.where(:descripcion => "COMPROMISO DE VENTAS SEMANAL").first.id
  			if ObjetivoSemanal.where(:vendedor => vendedorid, :anio => anio, :mes => mes , :numero_semana => semana, :tipo_objetivo => tipo_objetivo).first != nil
  				@cantidad=ObjetivoSemanal.where(:vendedor => vendedorid, :anio => anio, :mes => mes, :numero_semana => semana, :tipo_objetivo => tipo_objetivo).first.cantidad_propuesta
  			end
  		end
  		return @cantidad

    end

    def self.obtenerCompromisoDeVentasPromedio(anio,mes,semana,vendedores)
  		@cantidad=0
  		@cantidad1 = 0
  		dias = self.obtenerDiasSemana(anio,mes,semana)
		dias.each do |diasNom|
			vendedores.each do |v|
				tipo_objetivo =TipoObjetivo.where(:descripcion => "COMPROMISO DE VENTAS SEMANAL").first.id
	  			if ObjetivoSemanal.where(:vendedor => v.id, :anio => anio, :mes => mes , :numero_semana => semana, :tipo_objetivo => tipo_objetivo).first != nil
	  				@cantidad1=ObjetivoSemanal.where(:vendedor => v.id, :anio => anio, :mes => mes, :numero_semana => semana, :tipo_objetivo => tipo_objetivo).first.cantidad_propuesta
	  				if @cantidad < @cantidad1
	  					@cantidad = @cantidad1
	  			    end
	  			end
	  		end
  		end
  		return @cantidad

    end

    def self.obtenerMetaObMensual(anio,mes,vendedor,ob)
    		vid = vendedor.id
    		@cantidad = 0
    		tipo_objetivo =TipoObjetivo.where(:descripcion => ob).first.id
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


    def self.SumaObMensualVendedor(anio,mes,vendedor,ob)
  			case mes
	  			when 1,3,5,7,8,10,12
	  				dias=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
	  			when 4,6,9,11
	  				dias=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	  			else
	  				dias=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]
	  		end
  			@cantidad = 0
  			
  			tipo_objetivo =TipoObjetivo.where(:descripcion => ob).first.id
  			dias.each do |diasNom|
		  		fecha = Date.new(anio, mes, diasNom)	 
			  	 if CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => tipo_objetivo, :fecha => fecha ).first != nil
			  	 	@cantidad += CargaDiarium.where(:vendedor_id => vendedor, :tipo_objetivo_id => tipo_objetivo, :fecha => fecha ).first.cantidad
			  	 end
			 end
			return @cantidad

  	end

  	def self.calculoPorcentajeObVendedor(anio,mes,vendedor,ob)
  		@porcentaje = 0
  		if  self.obtenerMetaObMensual(anio,mes,vendedor,ob) != 0
  		  		@porcentaje = self.SumaObMensualVendedor(anio,mes,vendedor,ob) * 100 / self.obtenerMetaObMensual(anio,mes,vendedor,ob)
  		end
  		return @porcentaje
  	end

  	def self.calculoPorcentajeObEquipo(anio,mes,vendedores,ob,punto)
  		@porcentaje = 0
  		if  self.obtenerVentaPuntoVenta(anio,mes,punto,ob) != 0
  		  		@porcentaje = self.obtenerReservasEquipo(anio,mes,vendedores,ob) * 100 / self.obtenerVentaPuntoVenta(anio,mes,punto,ob)
  		end
  		return @porcentaje
  	end


    def self.obtenerReservasEquipo(anio,mes,vendedores,ob)
  			
  			@cantidad = 0
  			case mes
	  			when 1,3,5,7,8,10,12
	  				dias=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
	  			when 4,6,9,11
	  				dias=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
	  			else
	  				dias=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]
	  		end
  			tipo_objetivo =TipoObjetivo.where(:descripcion => ob).first.id
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

  	def self.obtenerVentaPuntoVenta(anio,mes,punto,ob)
  			punto = punto.id
    		@cantidad = 0
    		tipo_objetivo =TipoObjetivo.where(:descripcion => ob).first.id
  			if ObjetivoMensual.where(:mes =>mes, :anio => anio, :tipo_objetivo_id => tipo_objetivo, :punto_venta_id => punto).first != nil  				
  				@cantidad=ObjetivoMensual.where(:mes =>mes, :anio => anio, :tipo_objetivo_id => tipo_objetivo, :punto_venta_id => punto).first.cantidad_propuesta
  			end

  			return @cantidad
    end

	#por semana
    def self.obtenerObjPuntoVentaSemanal(anio,mes,punto,semana)
  			punto = punto.id
  			semanai = semana.to_i
    		@cantidad = 0
    		tipo_objetivo =TipoObjetivo.where(:descripcion => "VENTAS").first.id
  			if ObjetivoSemanal.where(:mes =>mes, :anio => anio, :numero_semana => semanai, :tipo_objetivo_id => tipo_objetivo, :punto_venta_id => punto).first != nil  				
  				@cantidad=ObjetivoSemanal.where(:mes =>mes, :anio => anio, :numero_semana => semanai, :tipo_objetivo_id => tipo_objetivo, :punto_venta_id => punto).first.cantidad_propuesta
  			end

  			return @cantidad
    end

#verificar
    def self.calculoDeAvanceEquipo(anio,mes,punto,vendedores)
  		meta = 0
  		reservas = 0
  		@avance = 0
  		vendedores.each do |vendedor|
	  			meta =+ self.obtenerMetaObMensual(anio,mes,vendedor,"VENTAS")
		  		reservas =+ self.SumaObMensualVendedor(anio,mes,vendedor,"VENTAS")
		end
		if meta != 0
			@avance = reservas * 100 / meta
		end
  		return @avance
  	end

  	def self.calculoDeAvancePorcentual(anio,mes)
  		@avance = 0
  		if Date.today.day > 1
  			dias = Date.today.day - 1

  			@avance = dias * 100 / ((Date.new(anio,mes).end_of_month).day)
  		end
  		return @avance

  	end

  	def self.calculoDeAvance(anio,mes,vendedor)
  		@avance = 0
  		if self.obtenerMetaObMensual(anio,mes,vendedor,"VENTAS") != 0
  			meta = self.obtenerMetaObMensual(anio,mes,vendedor,"VENTAS")
	  		if  self.SumaObMensualVendedor(anio,mes,vendedor,"VENTAS") != 0
	  			reservas = self.SumaObMensualVendedor(anio,mes,vendedor,"VENTAS")
	  			@avance = reservas * 100 / meta
	  		end
	  	end
  		return @avance
  	end



end

