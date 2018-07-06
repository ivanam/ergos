class NotificationsController < ApplicationController


  def index
    @notifications = Notification.where(recipient: current_user).recent
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end

  def verificarReuniones
  	
  	if current_user.has_role? :punto_venta
	    usermail = current_user.email
	  	persona = Persona.where(email: usermail).first

		carga_diaria = CargaDiarium.all.last

	  	mes = Date.today.month
	  	if Reunion.where(mes: mes, :persona_id => persona).first == nil
	  		if  Notification.where(:recipient_id => current_user, :actor_id => current_user, action: 'recordar').first == nil
	  			Notification.create!(recipient: current_user, actor: current_user, action: 'recordar', notifiable: carga_diaria)
	  		end
	  	end


	 end
	 respond_to do |format|
	 	format.json { head :no_content }
	 end

  end

  def verificar

  	vendedores = Vendedor.all
  	vendedores.each do |ve|


		if CargaDiarium.where(vendedor_id: ve.id).last == nil


			if  (Date.today - ve.created_at.to_date).round >= 0 and (Date.today - ve.created_at.to_date).round < 3

				 	ultima_carga =  ve.created_at.to_date
		    else
		    	ultima_carga = Date.today - 3
			end
		else
			ultima_carga = CargaDiarium.where(vendedor_id: ve.id).last.updated_at
			if  ( Date.today - ultima_carga.to_date ).round > 4
				ultima_carga = Date.today - 3
			else
				ultima_carga = CargaDiarium.where(vendedor_id: ve.id).last.updated_at
			end

		end


		carga_diaria = CargaDiarium.all.last

		persona = Persona.where(id: ve.persona_id).first
		user = User.where(email: persona.email).first
		recipients = []
		recipients << user
		personas_punto_venta = PersonaPuntoVentum.where(:punto_venta_id => ve.punto_venta_id)
		personas_punto_venta.each do |ppv|
	  		ppv_persona = Persona.where(id: ppv.persona_id).first
	  		res = User.where(email: ppv_persona.email).first
	  		if user != res
	  			recipients << res
	  		end
		end

	    actor = user
	    diferencia_fechas = ( Date.today - ultima_carga.to_date ).round


		while diferencia_fechas >= 1 

		        	actual = Date.today - diferencia_fechas
		       		concesionaria_id = PuntoVentum.where(:id => ve.punto_venta_id).first.concesionaria_id
		           	if Concesionarium.where(:id => concesionaria_id).first.hora != nil
		            	hora = Concesionarium.where(:id =>  concesionaria_id).first.hora
		            else
		            	hora = 20
		           	end

		            fecha = actual + 1
		           	if EstadoPersona.where(:vendedor_id => ve).where('fecha_inicio <= ?',fecha).where('fecha_fin >= ?',fecha).first == nil and !ve.baja

			            recipients.each do |recipient|
			                if actor != nil and recipient != nil and carga_diaria != nil
			                	if  Notification.where(recipient: recipient, actor: actor, action: 'no_cargo', notifiable: carga_diaria, fecha: fecha, hora: hora).first == nil
			                  		Notification.create!(recipient: recipient, actor: actor, action: 'no_cargo', notifiable: carga_diaria, fecha: fecha, hora: hora)
			                	end
			                end
			            end
		       		end
		       	    hora = hora + 2
		           	
		            if EstadoPersona.where(:vendedor_id => ve).where('fecha_inicio <= ?',fecha).where('fecha_fin >= ?',fecha).first == nil and !ve.baja
			            recipients.each do |recipient|
			                if actor != nil and recipient != nil and carga_diaria != nil
			                	if  Notification.where(recipient: recipient, actor: actor, action: 'no_cargo', notifiable: carga_diaria, fecha: fecha, hora: hora).first == nil
			                  		Notification.create!(recipient: recipient, actor: actor, action: 'no_cargo', notifiable: carga_diaria, fecha: fecha, hora: hora)
			                  	end
			                end
			            end
			        end

	        diferencia_fechas = diferencia_fechas - 1 
	     end

	     if diferencia_fechas == 0
			concesionaria_id = PuntoVentum.where(:id => ve.punto_venta_id).first.concesionaria_id
           	if Concesionarium.where(:id => concesionaria_id).first.hora != nil
            	hora = Concesionarium.where(:id =>  concesionaria_id).first.hora
            else
            	hora = 20
           	end

		    if (Time.now.hour >= hora)

		            fecha = Date.today
		            if EstadoPersona.where(:vendedor_id => ve).where('fecha_inicio <= ?',fecha).where('fecha_fin >= ?',fecha).first == nil and !ve.baja
			            recipients.each do |recipient|
			                if actor != nil and recipient != nil and carga_diaria != nil
			                	if ( Notification.where(recipient: recipient, actor: actor, action: 'no_cargo', notifiable: carga_diaria, fecha: fecha, hora: hora).first == nil)
			                  		Notification.create!(recipient: recipient, actor: actor, action: 'no_cargo', notifiable: carga_diaria, fecha: fecha, hora: hora)
			              		end
			                end
			            end
			        end
		     end

			hora = hora + 2
		    if (Time.now.hour >= hora)
			           	fecha = Date.today			           	
			           	if EstadoPersona.where(:vendedor_id => ve).where('fecha_inicio <= ?',fecha).where('fecha_fin >= ?',fecha).first == nil and !ve.baja
				            recipients.each do |recipient|
				                if actor != nil and recipient != nil and carga_diaria != nil
					                if ( Notification.where(recipient: recipient, actor: actor, action: 'no_cargo', notifiable: carga_diaria, fecha: fecha, hora: hora).first == nil)
					                  Notification.create!(recipient: recipient, actor: actor, action: 'no_cargo', notifiable: carga_diaria, fecha: fecha, hora: hora)
					                end
					            end
				            end
				         end
			end

	    end

	 respond_to do |format|
	 	format.json { head :no_content }
	 end
	end

  end
end
