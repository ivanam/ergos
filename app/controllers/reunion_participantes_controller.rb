class ReunionParticipantesController < ApplicationController
  before_action :set_reunion_participante, only: [:show, :edit, :update, :destroy]

  # GET /reunion_participantes
  # GET /reunion_participantes.json
  def index
    @reunion_participantes = ReunionParticipante.all
  end

  # GET /reunion_participantes/1
  # GET /reunion_participantes/1.json
  def show
  end

  # GET /reunion_participantes/new
  def new
    @reunion_participante = ReunionParticipante.new
  end

  # GET /reunion_participantes/1/edit
  def edit
  end

  # POST /reunion_participantes
  # POST /reunion_participantes.json
  def create
    @reunion_participante = ReunionParticipante.new(reunion_participante_params)

    respond_to do |format|
      if @reunion_participante.save
        format.html { redirect_to @reunion_participante, notice: 'Reunion participante was successfully created.' }
        format.json { render :show, status: :created, location: @reunion_participante }
      else
        format.html { render :new }
        format.json { render json: @reunion_participante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reunion_participantes/1
  # PATCH/PUT /reunion_participantes/1.json
  def update
    respond_to do |format|
      if @reunion_participante.update(reunion_participante_params)
        format.html { redirect_to @reunion_participante, notice: 'Reunion participante was successfully updated.' }
        format.json { render :show, status: :ok, location: @reunion_participante }
      else
        format.html { render :edit }
        format.json { render json: @reunion_participante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reunion_participantes/1
  # DELETE /reunion_participantes/1.json
  def destroy
    @reunion_participante.destroy
    respond_to do |format|
      format.html { redirect_to reunion_participantes_url, notice: 'Reunion participante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reunion_participante
      @reunion_participante = ReunionParticipante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reunion_participante_params
      params.require(:reunion_participante).permit(:reunion_id, :persona_id)
    end
end
