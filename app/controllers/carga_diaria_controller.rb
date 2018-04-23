class CargaDiariaController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_carga_diarium, only: [:show, :edit, :update, :destroy]

  # GET /carga_diaria
  # GET /carga_diaria.json
  def index
    @carga_diaria = CargaDiarium.all
    @data_personal = {
        datasets: [{
          data: [10, 20, 30],
          backgroundColor: ['blue', 'purple', 'orange']
        }],
        labels: ['PROSPECTOS','VENTAS','PRUEBAS DE MANEJO']
    }
    @options_personal = {
      title: {
        display: true,
        text: 'Yo'
      },
      responsive: true
    }
    @data_equipo = {
        datasets: [{
          data: [10, 20, 30],
          backgroundColor: ['blue', 'purple', 'orange']
        }],
        labels: ['PROSPECTOS', 'VENTAS', 'PRUEBAS DE MANEJO']
    }
    @options_equipo = { 
      title: {
        display: true,
        text: 'Equipo'
      }, 
      responsive: true 
    }
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
