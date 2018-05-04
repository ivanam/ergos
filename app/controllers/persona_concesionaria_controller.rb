class PersonaConcesionariaController < ApplicationController
  before_action :set_persona_concesionarium, only: [:show, :edit, :update, :destroy]

  # GET /persona_concesionaria
  # GET /persona_concesionaria.json
  def index
    @persona_concesionaria = PersonaConcesionarium.all
  end

  # GET /persona_concesionaria/1
  # GET /persona_concesionaria/1.json
  def show
  end

  # GET /persona_concesionaria/new
  def new
    @persona_concesionarium = PersonaConcesionarium.new(concesionaria_id: params[:concesionaria].to_i)
  end

  # GET /persona_concesionaria/1/edit
  def edit
  end

  # POST /persona_concesionaria
  # POST /persona_concesionaria.json
  def create
    @persona_concesionarium = PersonaConcesionarium.new(persona_concesionarium_params)
    respond_to do |format|
      if @persona_concesionarium.save
        format.html { redirect_to @persona_concesionarium.concesionaria, notice: 'Usuario creado correctamente' }
        format.json { render :show, status: :created, location: @persona_concesionarium }
      else
        format.html { render :new }
        format.json { render json: @persona_concesionarium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /persona_concesionaria/1
  # PATCH/PUT /persona_concesionaria/1.json
  def update
    respond_to do |format|
      if @persona_concesionarium.update(persona_concesionarium_params)
        format.html { redirect_to @persona_concesionarium, notice: 'Persona concesionarium was successfully updated.' }
        format.json { render :show, status: :ok, location: @persona_concesionarium }
      else
        format.html { render :edit }
        format.json { render json: @persona_concesionarium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /persona_concesionaria/1
  # DELETE /persona_concesionaria/1.json
  def destroy
    @concesionarium = Concesionarium.find(@persona_concesionarium.concesionaria_id)
    @persona_concesionarium.destroy
    respond_to do |format|
      format.html { redirect_to @concesionarium, notice: 'Se ha eliminado el Administrador de la Concesionaria.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona_concesionarium
      @persona_concesionarium = PersonaConcesionarium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_concesionarium_params
      params.require(:persona_concesionarium).permit(:persona_id, :concesionaria_id)
    end
end
