class ObjetivoMensualsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_objetivo_mensual, only: [:show, :edit, :update, :destroy]

  # GET /objetivo_mensuals
  # GET /objetivo_mensuals.json
  def index
    @objetivo_mensuals = ObjetivoMensual.all
  end

  # GET /objetivo_mensuals/1
  # GET /objetivo_mensuals/1.json
  def show
  end

  # GET /objetivo_mensuals/new
  def new
    @objetivo_mensual = ObjetivoMensual.new
  end

  # GET /objetivo_mensuals/1/edit
  def edit
  end

  # POST /objetivo_mensuals
  # POST /objetivo_mensuals.json
  def create
    @objetivo_mensual = ObjetivoMensual.new(objetivo_mensual_params)
    @objetivo_mensual.user_id = current_user.id
    respond_to do |format|
      if @objetivo_mensual.save
        format.html { redirect_to @objetivo_mensual, notice: 'Objetivo mensual creado con exito.' }
        format.json { render :show, status: :created, location: @objetivo_mensual }
      else
        format.html { render :new }
        format.json { render json: @objetivo_mensual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objetivo_mensuals/1
  # PATCH/PUT /objetivo_mensuals/1.json
  def update
    respond_to do |format|
      if @objetivo_mensual.update(objetivo_mensual_params)
        format.html { redirect_to @objetivo_mensual, notice: 'Objetivo mensual modificado con exito.' }
        format.json { render :show, status: :ok, location: @objetivo_mensual }
      else
        format.html { render :edit }
        format.json { render json: @objetivo_mensual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objetivo_mensuals/1
  # DELETE /objetivo_mensuals/1.json
  def destroy
    @objetivo_mensual.destroy
    respond_to do |format|
      format.html { redirect_to objetivo_mensuals_url, notice: 'Objetivo mensual eliminado con exito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objetivo_mensual
      @objetivo_mensual = ObjetivoMensual.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objetivo_mensual_params
      params.require(:objetivo_mensual).permit(:descripcion, :fecha_creacion, :tipo_objetivo_id, :cantidad_propuesta, :mes, :anio, :user_id, :vendedor_id, :punto_venta_id)
    end
end
