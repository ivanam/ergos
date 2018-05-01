class CargaDiariaController < ApplicationController
  include CargaDiariaHelper
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_carga_diarium, only: [:show, :edit, :update, :destroy]

  # GET /carga_diaria
  # GET /carga_diaria.json
  def index
    @carga_diaria = CargaDiarium.where(vendedor_id: current_user.id)

    carga_personal = CargaDiarium.select('tipo_objetivos.descripcion as descripcion, SUM(carga_diaria.cantidad) as cantidad').joins(:tipo_objetivo).where(vendedor_id: current_user.id).group('tipo_objetivos.descripcion')
    @data_personal = chart_data(carga_personal)
    @options_personal = chart_options('Yo')

    persona = Persona.find(current_user.persona_id)
    vendedor = Vendedor.find_by(persona_id: persona.id)
    personas_id = Vendedor.where(punto_venta_id: vendedor.punto_venta_id).map(&:persona_id)
    users_id = User.where(persona_id: personas_id)
    carga_equipo = CargaDiarium.select('tipo_objetivos.descripcion as descripcion, SUM(carga_diaria.cantidad) as cantidad').joins(:tipo_objetivo).where(vendedor_id: users_id).group('tipo_objetivos.descripcion')
    @data_equipo = chart_data(carga_equipo)
    @options_equipo = chart_options('Equipo')
  end

  # GET /carga_diaria/1
  # GET /carga_diaria/1.json
  def show
  end

  # GET /carga_diaria/new
  def new
    @carga_diarium = CargaDiarium.new
  end

  # GET /carga_diaria/1/edit
  def edit
  end

  # POST /carga_diaria
  # POST /carga_diaria.json
  def create
    @carga_diarium = CargaDiarium.new(carga_diarium_params)
    @carga_diarium.vendedor_id = current_user.id

    respond_to do |format|
      if @carga_diarium.save
        format.html { redirect_to @carga_diarium, notice: 'Se ha cargado una nueva carga diaria' }
        format.json { render :show, status: :created, location: @carga_diarium }
      else
        format.html { render :new }
        format.json { render json: @carga_diarium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carga_diaria/1
  # PATCH/PUT /carga_diaria/1.json
  def update
    respond_to do |format|
      if @carga_diarium.update(carga_diarium_params)
        format.html { redirect_to @carga_diarium, notice: 'Se ha actualizado la carga diaria.' }
        format.json { render :show, status: :ok, location: @carga_diarium }
      else
        format.html { render :edit }
        format.json { render json: @carga_diarium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carga_diaria/1
  # DELETE /carga_diaria/1.json
  def destroy
    @carga_diarium.destroy
    respond_to do |format|
      format.html { redirect_to carga_diaria_url, notice: 'Se ha eliminado la carga diaria.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carga_diarium
      @carga_diarium = CargaDiarium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carga_diarium_params
      params.require(:carga_diarium).permit(:fecha, :cantidad, :tipo_objetivo_id, :vendedor_id)
    end
end
