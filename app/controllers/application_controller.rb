require "application_responder"

class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
  before_action :set_notifications, if: :user_signed_in?

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.has_role? :dashboard
      redirect_to punto_venta_dashboard_path
    elsif  (current_user.has_role? :vendedor) || (current_user.has_role? :punto_venta)
      redirect_to home_vendedor_path, :alert => exception.message
    else
      redirect_to root_url, :alert => exception.message
    end
  end  


  def after_sign_in_path_for(resource)
    if current_user.has_role? :dashboard
      punto_venta_dashboard_path
    elsif (current_user.has_role? :vendedor) || (current_user.has_role? :punto_venta)
      home_vendedor_path
    else
      root_url
    end
  end



  def set_notifications
    @notifications = Notification.where(recipient: current_user, read_at: nil).limit(50)
  end

end
