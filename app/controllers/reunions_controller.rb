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

  def template
    @sidebar = false
    @footer = false
  end

    def create_template
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'file_name',
        #:template => 'salidas/show.html.erb',
        :template => 'reunions/template.html.erb',
        #:layout => 'application.html.erb',
        :layout => 'reunions/template.html.erb',
        #:header => {:content => render_to_string({:template => 'layouts/header.html.erb',:layout   => 'pdf.html.erb'})},
        #:footer=> { :right => 'Page [page] of [topage]' },
        #:margin => { :top => 60, :bottom => 50},
        #:footer => { :html => { :template => 'layouts/footer.html.erb' } },
        #:footer => {:content => render_to_string({:template => 'layouts/footer.html.erb',:layout   => 'pdf.html.erb'})}
        #:footer => {:html => { :template => 'layouts/footer.html.erb', :layout   => 'pdf.html.erb',}}   
        :show_as_html => params[:debug].present?
      end
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
