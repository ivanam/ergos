class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where(recipient: current_user).recent
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end
  def verificar
    vendedores = Vendedor.all
    vendedores.each do |ve|
      if CargaDiarium.where(vendedor_id: ve.id).last == nil
        ultima_carga = "01/01/2000 00:00:00"
      else
        ultima_carga = CargaDiarium.where(vendedor_id: ve.id).last.updated_at

      end
      carga_diaria = CargaDiarium.where(vendedor_id: ve.id).last
      #ACA PONER LA FECHA DE HORA QUE CIERRA Y ABRE EL LOCAL AL OTRO DIA BETTWEN ESE TIEMPO SE CREAN LAS NOTIFICACIONES
      if ultima_carga < DateTime.now
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
            recipients.each do |recipient|
              if actor != nil and recipient != nil and carga_diaria != nil
                Notification.create!(recipient: recipient, actor: actor, action: 'no_cargo', notifiable: carga_diaria)
            end
          end
        end
    end
  end
end
