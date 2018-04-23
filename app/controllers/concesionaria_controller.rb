class ConcesionariaController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_concesionarium, only: [:show, :edit, :update, :destroy]

  # GET /concesionaria
  # GET /concesionaria.json
  def index
    @concesionaria = Concesionarium.all
  end

  # GET /concesionaria/1
  # GET /concesionaria/1.json
  def show
  end

  # GET /concesionaria/new
  def new
    @concesionarium = Concesionarium.new
  end

  # GET /concesionaria/1/edit
  def edit
  end

  # POST /concesionaria
  # POST /concesionaria.json
  def create
    @concesionarium = Concesionarium.new(concesionarium_params)

    respond_to do |format|
      if @concesionarium.save
        format.html { redirect_to @concesionarium, notice: 'Concesionarium was successfully created.' }
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
        format.html { redirect_to @concesionarium, notice: 'Concesionarium was successfully updated.' }
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
    @concesionarium.destroy
    respond_to do |format|
      format.html { redirect_to concesionaria_url, notice: 'Concesionarium was successfully destroyed.' }
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
      params.require(:concesionarium).permit(:icono, :nombre, :fecha_alta, :fecha_baja, :user_id, :empresa_id, :persona_id)
    end
end
