class EstadoPersonasController < ApplicationController
  before_action :set_estado_persona, only: [:show, :edit, :update, :destroy]

  # GET /estado_personas
  # GET /estado_personas.json
  def index
    @estado_personas = EstadoPersona.all
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

    respond_to do | format|
      if @estado_persona.save
        format.html { redirect_to @estado_persona, notice: 'Estado persona was successfully created.' }
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
        format.html { redirect_to @estado_persona, notice: 'Estado persona was successfully updated.' }
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
      format.html { redirect_to estado_personas_url, notice: 'Estado persona was successfully destroyed.' }
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
      params.require(:estado_persona).permit(:estado, :persona_id, :fecha_inicio, :fecha_fin, :persona_id)
    end
end
