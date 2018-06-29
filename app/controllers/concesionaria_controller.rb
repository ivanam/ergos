class ConcesionariaController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_concesionarium, only: [:show, :edit, :update, :destroy, :select]

  # GET /concesionaria
  # GET /concesionaria.json
  def index
    @concesionaria = Concesionarium.all
    @bg_gray = true;
  end

  # GET /concesionaria/1
  # GET /concesionaria/1.json
  def show
    @bg_gray = true;
    if @concesionarium.baja
      raise CanCan::AccessDenied.new("Concesionaria dada de baja")
    end
  end

  # GET /concesionaria/new
  def new
    @bg_gray = true;
    @concesionarium = Concesionarium.new
  end

  # GET /concesionaria/1/edit
  def edit
    @bg_gray = true;
  end

  # POST /concesionaria
  # POST /concesionaria.json
  def create
    @concesionarium = Concesionarium.new(concesionarium_params)
    @concesionarium.fecha_alta = DateTime.now
    @concesionarium.user_id = current_user.id
    respond_to do |format|
      if @concesionarium.save
        format.html { redirect_to @concesionarium, notice: 'Concesionaria creada con exito.' }
        format.json { render :show, status: :created, location: @concesionarium }
      else
        format.html { render :new }
        format.json { render json: @concesionarium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concesionaria/1
  # PATCH/PUT /concesionaria/1.json
  def update
    respond_to do |format|
      if @concesionarium.update(concesionarium_params)
        format.html { redirect_to @concesionarium, notice: 'Concesionaria modificada con exito.' }
        format.json { render :show, status: :ok, location: @concesionarium }
      else
        format.html { render :edit }
        format.json { render json: @concesionarium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concesionaria/1
  # DELETE /concesionaria/1.json
  def destroy
    @concesionarium.dar_baja(Date.today)
    respond_to do |format|
      format.html { redirect_to concesionaria_url, notice: 'Concesionaria eliminada con exito.' }
      format.json { head :no_content }
    end
  end

  def select
    current_user.update(concesionaria_id: @concesionarium.id)
    if !@concesionarium.puntos_venta.where(baja: false).blank?
      current_user.update(punto_venta_id: @concesionarium.puntos_venta.where(baja: false).first.id)
    end
    respond_to do |format|
      format.html { redirect_to @concesionarium, notice: 'Concesionaria seleccionada' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concesionarium
      @concesionarium = Concesionarium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concesionarium_params
      params.require(:concesionarium).permit(:icono, :nombre, :cantPv, :cantVend, :fecha_alta, :fecha_baja, :user_id, :empresa_id, :persona_id, :logo,  persona_concesionaria_attributes: [:id, :persona_id, :_destroy])
    end
end
