class ReunionsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_reunion, only: [:show, :edit, :update, :destroy]


  # GET /reunions
  # GET /reunions.json
  def index
    @reunions = Reunion.all
  end

  # GET /reunions/1
  # GET /reunions/1.json
  def show
  end

  # GET /reunions/new
  def new
    @reunion = Reunion.new
  end

  # GET /reunions/1/edit
  def edit
  end


   def template_pdf
    debugger
    respond_to do |format|
    format.pdf do
      render :pdf => 'template_pdf', 
      :template => 'reunion/template_pdf.html.erb',
      :layout => 'pdf.html.erb',
      :orientation => 'Portrait',# default Portrait
      :page_size => 'Legal'
    end
    format.html 
    end 
  end


  # POST /reunions
  # POST /reunions.json
  def create
    @reunion = Reunion.new(reunion_params)
    respond_to do |format|
      if @reunion.save
        format.html { redirect_to @reunion, notice: 'Se ha creado una nueva Reunion.' }
        format.json { render :show, status: :created, location: @reunion }
      else
        format.html { render :new }
        format.json { render json: @reunion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reunions/1
  # PATCH/PUT /reunions/1.json
  def update
    respond_to do |format|
      if @reunion.update(reunion_params)
        format.html { redirect_to @reunion, notice: 'Se ha actualizado la Reunion.' }
        format.json { render :show, status: :ok, location: @reunion }
      else
        format.html { render :edit }
        format.json { render json: @reunion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reunions/1
  # DELETE /reunions/1.json
  def destroy
    @reunion.reunion_participantes.destroy_all
    @reunion.destroy
    respond_to do |format|
      format.html { redirect_to reunions_url, notice: 'Se ha eliminado la Reunion.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reunion
      @reunion = Reunion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reunion_params
      params.require(:reunion).permit(:fecha, :semana, :lugar_fisico, :persona_id, reunion_participantes_attributes: [:id, :persona_id, :_destroy])
    end
end
