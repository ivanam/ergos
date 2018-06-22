class ObjetivoSemanalsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_objetivo_semanal, only: [:show, :edit, :update, :destroy]

  # GET /objetivo_semanals
  # GET /objetivo_semanals.json
  def index
    @objetivo_semanals = ObjetivoSemanal.all
  end

  # GET /objetivo_semanals/1
  # GET /objetivo_semanals/1.json
  def show
  end

  # GET /objetivo_semanals/new
  def new
    @objetivo_semanal = ObjetivoSemanal.new(punto_venta_id: current_user.punto_venta_id)
  end

  # GET /objetivo_semanals/1/edit
  def edit
  end

  # POST /objetivo_semanals
  # POST /objetivo_semanals.json
  def create
    @objetivo_semanal = ObjetivoSemanal.new(objetivo_semanal_params)
    @objetivo_semanal.mes = params[:date][:mes]
    @objetivo_semanal.anio = params[:date][:anio]
    @objetivo_semanal.punto_venta_id = current_user.punto_venta_id
    @objetivo_semanal.vendedor_id=params[:vendedor_id]
    @objetivo_semanal.tipo_objetivo_id=params[:tipo_objetivo_id]
    respond_to do |format|
      if @objetivo_semanal.save
        format.html { redirect_to @objetivo_semanal, notice: 'Objetivo semanal creado con exito.' }
        format.json { render :show, status: :created, location: @objetivo_semanal }
      else
        format.html { render :new }
        format.json { render json: @objetivo_semanal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objetivo_semanals/1
  # PATCH/PUT /objetivo_semanals/1.json
  def update
    respond_to do |format|
      if @objetivo_semanal.update(objetivo_semanal_params)
        format.html { redirect_to @objetivo_semanal, notice: 'Objetivo semanal modificado con exito.' }
        format.json { render :show, status: :ok, location: @objetivo_semanal }
      else
        format.html { render :edit }
        format.json { render json: @objetivo_semanal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objetivo_semanals/1
  # DELETE /objetivo_semanals/1.json
  def destroy
    @objetivo_semanal.destroy
    respond_to do |format|
      format.html { redirect_to objetivo_semanals_url, notice: 'Objetivo semanal eliminado con exito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objetivo_semanal
      @objetivo_semanal = ObjetivoSemanal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objetivo_semanal_params
      params.require(:objetivo_semanal).permit(:objetivo_mensual_id, :fecha_creacion, :cantidad_propuesta, :numero_semana, :user_id, :vendedor_id, :punto_venta_id, :tipo_objetivo_id, :anio, :mes)
    end
end
