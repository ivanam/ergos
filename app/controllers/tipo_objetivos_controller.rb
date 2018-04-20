class TipoObjetivosController < ApplicationController
  before_action :set_tipo_objetivo, only: [:show, :edit, :update, :destroy]

  # GET /tipo_objetivos
  # GET /tipo_objetivos.json

  respond_to :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: TipoObjetivo.new(view_context, { query: TipoObjetivo.all }) }
    end
  end

  def index
    @tipo_objetivos = TipoObjetivo.all
  end


  # GET /tipo_objetivos/1
  # GET /tipo_objetivos/1.json
  def show
  end

  # GET /tipo_objetivos/new
  def new
    @tipo_objetivo = TipoObjetivo.new
  end

  # GET /tipo_objetivos/1/edit
  def edit
  end

  # POST /tipo_objetivos
  # POST /tipo_objetivos.json
  def create
    @tipo_objetivo = TipoObjetivo.new(tipo_objetivo_params)

    respond_to do |format|
      if @tipo_objetivo.save
        format.html { redirect_to @tipo_objetivo, notice: 'Tipo objetivo was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_objetivo }
      else
        format.html { render :new }
        format.json { render json: @tipo_objetivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_objetivos/1
  # PATCH/PUT /tipo_objetivos/1.json
  def update
    respond_to do |format|
      if @tipo_objetivo.update(tipo_objetivo_params)
        format.html { redirect_to @tipo_objetivo, notice: 'Tipo objetivo was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_objetivo }
      else
        format.html { render :edit }
        format.json { render json: @tipo_objetivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_objetivos/1
  # DELETE /tipo_objetivos/1.json
  def destroy
    @tipo_objetivo.destroy
    respond_to do |format|
      format.html { redirect_to tipo_objetivos_url, notice: 'Tipo objetivo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_objetivo
      @tipo_objetivo = TipoObjetivo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_objetivo_params
      params.require(:tipo_objetivo).permit(:descripcion)
    end
end
