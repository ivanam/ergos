class VendedorsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_vendedor, only: [:show, :edit, :update, :destroy]

  # GET /vendedors
  # GET /vendedors.json
  def index
    @vendedors = Vendedor.where(punto_venta_id: current_user.punto_venta_id)
  end

  # GET /vendedors/1
  # GET /vendedors/1.json
  def show
    
  end

  # GET /vendedors/new
  def new
    @vendedor = Vendedor.new
    @persona = Persona.new
  end

  # GET /vendedors/1/edit
  def edit
   

  end

  # POST /vendedors
  # POST /vendedors.json
  def create
    @vendedor = Vendedor.new(vendedor_params)
    debugger
    @vendedor.punto_venta_id = current_user.punto_venta_id
    pv = @vendedor.punto_venta
    cantVend = pv.concesionaria.cantVend
    cantvendconc = Vendedor.where(:id => @vendedor.punto_venta_id).count
    if (cantVend <= cantvendconc)
      flash[:notice] = 'No puede crear mas Vendedores para este punto de venta, solicite permiso'
    end
    if  Persona.where(:numero_documento => params[:cuil]).first == nil
      @persona = Persona.new(persona_params)
    else
      @persona= Persona.where(:numero_documento => params[:cuil]).first
      @persona.tipo_documento_id=params[:persona][:tipo_documento_id]
      @persona.numero_documento=params[:persona][:numero_documento]
      @persona.apellido=params[:persona][:apellido]
      @persona.nombre=params[:persona][:nombre]
      @persona.domicilio=params[:persona][:domicilio]
      @persona.telefono=params[:persona][:telefono]
      @persona.fecha_nacimiento=params[:persona][:fecha_nacimiento]
      @persona.email=params[:persona][:email]
    end
   
    #el numero de vendedor debe ser unico
    respond_to do |format|
             if @persona.save
                 @vendedor.persona_id=@persona.id
                 if @vendedor.save
                    format.html { redirect_to @vendedor, notice: 'Vendedor was successfully created.' }
                    format.json { render :show, status: :created, location: @vendedor }
                 else
                    format.html { render :new }
                    format.json { render json: @vendedor.errors, status: :unprocessable_entity }
                 end
             else

                format.html { render :new }
                format.json { render json: @persona.errors.full_messages, status: :unprocessable_entity }
             end
  
    end
  end

  # PATCH/PUT /vendedors/1
  # PATCH/PUT /vendedors/1.json
  def update
    respond_to do |format|
      if @vendedor.update(vendedor_params)
        format.html { redirect_to @vendedor, notice: 'Vendedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendedor }
      else
        format.html { render :edit }
        format.json { render json: @vendedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendedors/1
  # DELETE /vendedors/1.json
  def destroy
    @vendedor.destroy
    respond_to do |format|
      format.html { redirect_to vendedors_url, notice: 'Vendedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendedor
      @vendedor = Vendedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendedor_params
      params.require(:vendedor).permit(:foto, :numero, :fecha_alta, :fecha_baja, :persona_id, :punto_venta_id)
    end

    def persona_params
      params.require(:persona).permit(:tipo_documento_id, :numero_documento, :cuit, :apellido, :nombre, :domicilio, :telefono, :email, :fecha_nacimiento)
    end
end
