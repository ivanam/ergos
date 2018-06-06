class PersonasController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_persona, only: [:show, :edit, :update, :destroy, :cambiar_contrasenia]

  # GET /personas
  # GET /personas.json
  def index
    @personas = Persona.all
  end

  # GET /personas/1
  # GET /personas/1.json
  def show
  end

  # GET /personas/new
  def new
    @persona = Persona.new
  end

  def new_persona_concesionaria
    @concesionaria_id = params[:concesionaria]
    @persona = Persona.new
  end

  def new_administrador
    @persona = Persona.new
  end

  def administradores
    personas_id = []

    User.all.each do |u|
      if u.admin? 
        personas_id << u.persona_id
      end
    end

    @personas = Persona.where(id: personas_id)
  end

  def new_persona_punto_venta
    @punto_venta_id = params[:punto_venta]
    @persona = Persona.new
  end

  # GET /personas/1/edit
  def edit
  end

  # POST /personas
  # POST /personas.json
  def create
    @persona = Persona.new(persona_params)
    if params[:concesionaria].to_i > 0
      respond_to do |format|
        if @persona.save
          format.html { redirect_to new_persona_concesionarium_path(concesionaria: params[:concesionaria], persona: @persona.id), notice: 'Persona creada correctamente.' }
          format.json { render :show, status: :created, location: @persona }
        else
          format.html { redirect_to new_persona_concesionaria_path(concesionaria: params[:concesionaria]), alert: @persona.errors.full_messages  }
          format.json { render json: @persona.errors, status: :unprocessable_entity }
        end
      end
    elsif params[:punto_venta].to_i > 0
      respond_to do |format|
        if @persona.save
          format.html { redirect_to new_persona_punto_ventum_path(punto_venta: params[:punto_venta], persona: @persona.id), notice: 'Persona creada correctamente.' }
          format.json { render :show, status: :created, location: @persona }
        else
          format.html { redirect_to new_persona_punto_venta_path(punto_venta: params[:punto_venta]), alert: @persona.errors.full_messages  }
          format.json { render json: @persona.errors, status: :unprocessable_entity }
        end
      end
    elsif params[:admin].to_i > 0
      respond_to do |format|
        if @persona.save
          usuario = User.new(email: @persona.email, password: "12345678", persona_id: @persona.id)
          if usuario.save
            usuario.add_role("admin")
          else
            format.html { redirect_to new_administrador_path(admin: params[:admin]), alert: usuario.errors.full_messages  }
            format.json { render json: usuario.errors, status: :unprocessable_entity }
          end
          format.html { redirect_to administradores_path, notice: 'Persona creada correctamente.' }
          format.json { render :show, status: :created, location: @persona }
        else
          format.html { redirect_to new_administrador_path(admin: params[:admin]), alert: @persona.errors.full_messages  }
          format.json { render json: @persona.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @persona.save
          format.html { redirect_to @persona, notice: 'Persona was successfully created.' }
          format.json { render :show, status: :created, location: @persona }
        else
          format.html { render :new }
          format.json { render json: @persona.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    if !user_params.nil?
      respond_to do |format|
        if @persona.user.update(user_params)
          format.html { redirect_to root_path, notice: 'Cambio de contraseña correcto.' }
          format.json { render :show, status: :ok, location: @persona.user }
        else
          format.html { render :cambiar_contrasenia }
          format.json { render json: @persona.user.errors, status: :unprocessable_entity }
        end
      end
    
    else

      respond_to do |format|
        if @persona.update(persona_params)
          format.html { redirect_to @persona, notice: 'Persona was successfully updated.' }
          format.json { render :show, status: :ok, location: @persona }
        else
          format.html { render :edit }
          format.json { render json: @persona.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to administradores_path, notice: 'Persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def buscar_persona
    @persona = Persona.where(:cuit => params[:cuit]).first
    render json: @persona
  end

  def buscar_persona_completa
    
    @persona = Persona.where(:cuit => params[:cuit]).first
    render json: @persona
  end

  def cambiar_contrasenia

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:tipo_documento_id, :numero_documento, :cuit, :apellido, :nombre, :domicilio, :telefono, :email, :fecha_nacimiento)
    end
    def user_params
      params.require(:user).permit(:password_confirmation, :reset_password_token, :password)
    end
end
