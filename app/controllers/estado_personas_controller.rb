class EstadoPersonasController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_estado_persona, only: [:show, :edit, :update, :destroy]

  # GET /estado_personas
  # GET /estado_personas.json
  def index
    if params[:vendedor].blank?
      vendedores = current_user.punto_venta.vendedors
      @estado_personas = EstadoPersona.where(vendedor_id: vendedores)
    else
      @vendedor = Vendedor.where(numero: params[:vendedor]).first
      @estado_personas = EstadoPersona.where(vendedor_id: @vendedor.id)
    end
    @bg_gray = true

  end

  # GET /estado_personas/1
  # GET /estado_personas/1.json
  def show
    @bg_gray = true

  end

  # GET /estado_personas/new
  def new
    @estado_persona = EstadoPersona.new
    @bg_gray = true
  end

  # GET /estado_personas/1/edit
  def edit
    @bg_gray = true
  end

  # POST /estado_personas
  # POST /estado_personas.json
  def create
    @estado_persona = EstadoPersona.new(estado_persona_params)
    @estado_persona.estado_id = params[:estado_persona][:estado_id]
    @estado_persona.vendedor_id =  params[:estado_persona][:vendedor_id]
    @estado_persona.fecha_inicio = params[:estado_persona][:fecha_inicio]

    respond_to do | format|
      if @estado_persona.save
        format.html { redirect_to @estado_persona, notice: 'Estado creado con exito.' }
        format.json { render :show, status: :created, location: @estado_persona }
      else
        format.html { render :new }
        format.json { render json: @estado_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_personas/1
  # PATCH/PUT /estado_personas/1.json
  def update
    respond_to do |format|
      if @estado_persona.update(estado_persona_params)
        format.html { redirect_to @estado_persona, notice: 'Se ha editado el Estado con exito.' }
        format.json { render :show, status: :ok, location: @estado_persona }
      else
        format.html { render :edit }
        format.json { render json: @estado_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_personas/1
  # DELETE /estado_personas/1.json
  def destroy
    @estado_persona.destroy
    respond_to do |format|
      format.html { redirect_to estado_personas_url, notice: 'Se ha eliminado el estado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_persona
      @estado_persona = EstadoPersona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_persona_params
      params.require(:estado_persona).permit(:persona_id, :fecha_inicio, :fecha_fin, :persona_id, :estado_id)
    end
end
