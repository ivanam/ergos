class UtilController < ApplicationController

  def buscar_persona    
    @persona = Persona.where(:numero_documento => params[:dni]).first()
    render json: @persona
  end


end