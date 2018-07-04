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
			ultima_carga = Date.today -2  
		else
			ultima_carga = CargaDiarium.where(vendedor_id: ve.id).last.updated_at
			if diferencia_fechas = ( Date.today - ultima_carga.to_date ).round > 4
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
	  		recipients << res
		end
	    actor = user
	    diferencia_fechas = ( Date.today - ultima_carga.to_date ).round

		while diferencia_fechas > 1 
		        #preguntar si estaba activo
		        actual = Date.today - diferencia_fechas + 1
		        notifications = Notification.where(:fecha => actual, :recipient_id => user, :actor_id => user, action: 'no_cargo')
		        notificacion1 = nil
		        notificacion2 = nil
		        if notifications != nil 
		          cant = Notification.where(:fecha => actual, :recipient_id => user, :actor_id => user, action: 'no_cargo').count
		          lista = Notification.where(:fecha => actual, :recipient_id => user, :actor_id => user, action: 'no_cargo')
		          if cant > 1
			          notificacion2 = lista[cant-1]
			          notificacion1 = lista[cant-2]
			      elsif cant == 1
			      	notificacion1 = lista[0]		      	
			      end
		        end
		        if notificacion1 == nil
		           	if Concesionarium.where(:id => ve.punto_venta_id).first != nil
		            	hora = Concesionarium.where(:id => ve.punto_venta_id).first.fin_jornada
		            else
		            	hora = 20
		           	end
		            fecha = actual
		            recipients.each do |recipient|
		                if actor != nil and recipient != nil and carga_diaria != nil
		                  Notification.create!(recipient: recipient, actor: actor, action: 'no_cargo', notifiable: carga_diaria, fecha: fecha, hora: hora)
		                end
		            end
		        end
		        if notificacion2 == nil
		           	if Concesionarium.where(:id => ve.punto_venta_id).first != nil
		            	hora = Concesionarium.where(:id => ve.punto_venta_id).first.fin_jornada
		            	hora = hora + 2
		            else
		            	hora = 22
		           	end
		            fecha = actual
		            recipients.each do |recipient|
		                if actor != nil and recipient != nil and carga_diaria != nil
		                  Notification.create!(recipient: recipient, actor: actor, action: 'no_cargo', notifiable: carga_diaria, fecha: fecha, hora: hora)
		                end
		            end
		        end

	        diferencia_fechas = diferencia_fechas - 1 
	     end
	     if diferencia_fechas == 1
	     	if (Notification.where(:fecha => Date.today, :recipient_id => user, :actor_id => user, action: 'no_cargo', hora: 22).first == nil)

		     	if (Time.now.hour >= 22)
		     			if (Concesionarium.where(:id => ve.punto_venta_id).first != nil)
			            	hora = Concesionarium.where(:id => ve.punto_venta_id).first.fin_jornada
			            	hora = hora + 2
			            else
			            	hora = 22
			           	end
			           	fecha = Date.today
			            recipients.each do |recipient|
			                if actor != nil and recipient != nil and carga_diaria != nil
			                  Notification.create!(recipient: recipient, actor: actor, action: 'no_cargo', notifiable: carga_diaria, fecha: fecha, hora: hora)
			                end
			            end
			     end
			 
			 elsif(Notification.where(:fecha => Date.today, :recipient_id => user, :actor_id => user, action: 'no_cargo', hora: 20).first == nil)


			     if (Time.now.hour >= 20)
			     		if Concesionarium.where(:id => ve.punto_venta_id).first != nil
			            	hora = Concesionarium.where(:id => ve.punto_venta_id).first.fin_jornada

			            else
			            	hora = 20
			           	end

			            fecha = Date.today
			            recipients.each do |recipient|
			                if actor != nil and recipient != nil and carga_diaria != nil
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
