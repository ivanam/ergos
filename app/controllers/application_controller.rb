require "application_responder"

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    if  (current_user.has_role? :vendedor) || (current_user.has_role? :punto_venta)
      redirect_to home_vendedor_path, :alert => exception.message
    else
      redirect_to root_url, :alert => exception.message
    end
  end  


  def after_sign_in_path_for(resource)
    if  (current_user.has_role? :vendedor) || (current_user.has_role? :punto_venta)
      home_vendedor_path
    else
      root_url
    end
  end

end
