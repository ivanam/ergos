class TipoIndicadorsController < ApplicationController
  before_action :set_tipo_indicador, only: [:show, :edit, :update, :destroy]

  # GET /tipo_indicadors
  # GET /tipo_indicadors.json
  def index
    @tipo_indicadors = TipoIndicador.all
  end

  # GET /tipo_indicadors/1
  # GET /tipo_indicadors/1.json
  def show
  end

  # GET /tipo_indicadors/new
  def new
    @tipo_indicador = TipoIndicador.new
  end

  # GET /tipo_indicadors/1/edit
  def edit
  end

  # POST /tipo_indicadors
  # POST /tipo_indicadors.json
  def create
    @tipo_indicador = TipoIndicador.new(tipo_indicador_params)

    respond_to do |format|
      if @tipo_indicador.save
        format.html { redirect_to @tipo_indicador, notice: 'Tipo indicador was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_indicador }
      else
        format.html { render :new }
        format.json { render json: @tipo_indicador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_indicadors/1
  # PATCH/PUT /tipo_indicadors/1.json
  def update
    respond_to do |format|
      if @tipo_indicador.update(tipo_indicador_params)
        format.html { redirect_to @tipo_indicador, notice: 'Tipo indicador was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_indicador }
      else
        format.html { render :edit }
        format.json { render json: @tipo_indicador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_indicadors/1
  # DELETE /tipo_indicadors/1.json
  def destroy
    @tipo_indicador.destroy
    respond_to do |format|
      format.html { redirect_to tipo_indicadors_url, notice: 'Tipo indicador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_indicador
      @tipo_indicador = TipoIndicador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_indicador_params
      params.require(:tipo_indicador).permit(:descripcion)
    end
end
