class PuntoVentaController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_punto_ventum, only: [:show, :edit, :update, :destroy]
  

  # GET /punto_venta
  # GET /punto_venta.json
  def index
    @punto_venta = PuntoVentum.all
  end

  # GET /punto_venta/1
  # GET /punto_venta/1.json
  def show
  end

  # GET /punto_venta/new
  def new
    @punto_ventum = PuntoVentum.new
  end

  # GET /punto_venta/1/edit
  def edit
  end

  # POST /punto_venta
  # POST /punto_venta.json
  def create
    @punto_ventum = PuntoVentum.new(punto_ventum_params)

    respond_to do |format|
      if @punto_ventum.save
        format.html { redirect_to @punto_ventum, notice: 'Punto ventum was successfully created.' }
        format.json { render :show, status: :created, location: @punto_ventum }
      else
        format.html { render :new }
        format.json { render json: @punto_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /punto_venta/1
  # PATCH/PUT /punto_venta/1.json
  def update
    respond_to do |format|
      if @punto_ventum.update(punto_ventum_params)
        format.html { redirect_to @punto_ventum, notice: 'Punto ventum was successfully updated.' }
        format.json { render :show, status: :ok, location: @punto_ventum }
      else
        format.html { render :edit }
        format.json { render json: @punto_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /punto_venta/1
  # DELETE /punto_venta/1.json
  def destroy
    @punto_ventum.destroy
    respond_to do |format|
      format.html { redirect_to punto_venta_url, notice: 'Punto ventum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def dashboard
    @sidebar = false
    @footer = false

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_punto_ventum
      @punto_ventum = PuntoVentum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def punto_ventum_params
      params.require(:punto_ventum).permit(:nombre, :domicilio, :concesionaria_id, :persona_id)
    end
end
