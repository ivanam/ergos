class PersonaPuntoVentaController < ApplicationController
  before_action :set_persona_punto_ventum, only: [:show, :edit, :update, :destroy]

  # GET /persona_punto_venta
  # GET /persona_punto_venta.json
  def index
    @persona_punto_venta = PersonaPuntoVentum.all
  end

  # GET /persona_punto_venta/1
  # GET /persona_punto_venta/1.json
  def show
  end

  # GET /persona_punto_venta/new
  def new
    if params[:persona].to_i > 0
    @persona_punto_ventum = PersonaPuntoVentum.new(punto_venta_id: params[:punto_venta],persona_id: params[:persona].to_i)
    else
    @persona_punto_ventum = PersonaPuntoVentum.new(punto_venta_id: params[:punto_venta])
    end  
  end

  # GET /persona_punto_venta/1/edit
  def edit
  end

  # POST /persona_punto_venta
  # POST /persona_punto_venta.json
  def create
    @persona_punto_ventum = PersonaPuntoVentum.new(persona_punto_ventum_params)

    respond_to do |format|
      if @persona_punto_ventum.save
        format.html { redirect_to @persona_punto_ventum.punto_venta, notice: 'Persona punto ventum was successfully created.' }
        format.json { render :show, status: :created, location: @persona_punto_ventum }
      else
        format.html { render :new }
        format.json { render json: @persona_punto_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /persona_punto_venta/1
  # PATCH/PUT /persona_punto_venta/1.json
  def update
    respond_to do |format|
      if @persona_punto_ventum.update(persona_punto_ventum_params)
        format.html { redirect_to @persona_punto_ventum, notice: 'Persona punto ventum was successfully updated.' }
        format.json { render :show, status: :ok, location: @persona_punto_ventum }
      else
        format.html { render :edit }
        format.json { render json: @persona_punto_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /persona_punto_venta/1
  # DELETE /persona_punto_venta/1.json
  def destroy
    @punto_venta = PuntoVentum.find(@persona_punto_ventum.punto_venta_id)
    @persona_punto_ventum.destroy
    respond_to do |format|
      format.html { redirect_to @punto_venta, notice: 'Persona punto ventum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona_punto_ventum
      @persona_punto_ventum = PersonaPuntoVentum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_punto_ventum_params
      params.require(:persona_punto_ventum).permit(:persona_id, :punto_venta_id)
    end
end
