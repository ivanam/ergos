class PuntoVentaController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_punto_ventum, only: [:show, :edit, :update, :destroy, :select]
  

  # GET /punto_venta
  # GET /punto_venta.json
  def index
    @bg_gray = true

    @punto_venta = PuntoVentum.where(concesionaria_id: current_user.concesionaria_id)
  end

  # GET /punto_venta/1
  # GET /punto_venta/1.json
  def show
    if  ((current_user.has_role? :vendedor) || (current_user.has_role? :punto_venta)) and (current_user.punto_venta_id.to_i != @punto_ventum.id)
      redirect_to home_vendedor_path, :alert => "No esta autorizado"
    end
    @bg_gray = true

  end

  # GET /punto_venta/new
  def new
    @bg_gray = true

    @punto_ventum = PuntoVentum.new(concesionaria_id: current_user.concesionaria_id)
  end

  # GET /punto_venta/1/edit
  def edit
    @bg_gray = true

  end

  # POST /punto_venta
  # POST /punto_venta.json
  def create
    @punto_ventum = PuntoVentum.new(punto_ventum_params)
    #@conc = Concesionarium.where(:id => @punto_ventum.concesionaria_id).first.cantPv
    #@cantpuntoventa = PuntoVentum.where(:concesionaria_id => @punto_ventum.concesionaria_id).count
    #if (@conc <= @cantpuntoventa)
      # respond_to do |format|
      #   flash[:notice] = 'No puede crear mas Puntos de Venta'
      #   format.html {render :new, notice: 'No puede crear mas Puntos de Venta' }
      #  end
      #else
  # =begin  debugger  
  #   pv = @punto_ventum
  #   cantPv = pv.concesionaria.cantPv
  #   cantPvconc = PuntoVentum.where(:concesionaria_id => @punto_ventum.concesionaria_id).count
  #   if (cantPv < cantPvconc)
  #     flash[:notice] = 'No puede crear mas puntos de venta, solicite permiso'
  #   end=end
        respond_to do |format|
          if @punto_ventum.save
            format.html { redirect_to @punto_ventum, notice: 'Punto ventum was successfully created.' }
            format.json { render :show, status: :created, location: @punto_ventum }
          else
            format.html { render :new }
            format.json { render json: @punto_ventum.errors, status: :unprocessable_entity }
          end
        #end
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

  def select
    current_user.update(punto_venta_id: @punto_ventum.id)
    respond_to do |format|
      format.html { redirect_to @punto_ventum, notice: 'Punto de venta seleccionado' }
      format.json { head :no_content }
    end
  end


  def dashboard
    @sidebar = false
    @footer = false
    @bg_gray = true
    @punto_venta = PuntoVentum.where(:id => current_user.punto_venta_id).first
    @vendedores = Vendedor.where(:punto_venta_id => @punto_venta.id)

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
