class VendedorsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_vendedor, only: [:show, :edit, :update, :destroy]

  # GET /vendedors
  # GET /vendedors.json
  def index
    @bg_gray = true

    @vendedors = Vendedor.where(punto_venta_id: current_user.punto_venta_id)
  end

  # GET /vendedors/1
  # GET /vendedors/1.json
  def show
    @bg_gray = true
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'obj_vend_pdf', 
          :template => 'vendedors/obj_vend_pdf.html.erb',
          :layout => 'pdf.html.erb',
          :orientation => 'Portrait',# default Portrait
          :page_size => 'Legal'
      end
    end
  end

  # GET /vendedors/new
  def new
    @bg_gray = true

    @vendedor = Vendedor.new
    @persona = Persona.new
  end

  # GET /vendedors/1/edit
  def edit
    @vendedor = Vendedor.where(:id => params[:id]).first
    @bg_gray = true

  end

  # POST /vendedors
  # POST /vendedors.json
  def create
    @vendedor = Vendedor.new(vendedor_params)
    @vendedor.punto_venta_id = current_user.punto_venta_id
    pv = @vendedor.punto_venta
    cantVend = pv.concesionaria.cantVend
    cantvendconc = Vendedor.where(:id => @vendedor.punto_venta_id).count
    if (cantVend.to_i <= cantvendconc.to_i + 1 )
      flash[:notice] = 'No puede crear mas Vendedores para este punto de venta, solicite permiso'
    end
    if Persona.where(:cuit => params[:persona][:cuit]).first == nil
      @persona = Persona.new(persona_params)
    else
      @persona= Persona.where(:cuit => params[:persona][:cuit]).first
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
                format.json { render json: @persona.errors, status: :unprocessable_entity }
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

  def home
    @sidebar = false
    @footer = false
    @carga_diarium = CargaDiarium.new
    @tipos_objetivos = TipoObjetivo.where(tipo: 'KPI')
    if current_user.has_role? :vendedor
      @vendedor = current_user.persona.vendedors.first
    else
      if (current_user.has_role? :punto_venta) && (!params[:vendedor].nil?)
        @vendedor = Vendedor.find_by(numero: params[:vendedor])
      end
    end
  end

  def objetivos_y_carga_diaria
    mes = params[:mes].to_i
    anio = params[:anio].to_i
    vendedor_id = params[:vendedor_id].to_i
    vendedor = Vendedor.find(vendedor_id)
    totales = Hash.new
    total_ob_op = ObjetivoMensual.objetivo_pm(anio, mes, vendedor, 7)
    total_ob_pm = ObjetivoMensual.objetivo_pm(anio, mes, vendedor, 4)
    total_ob_v = ObjetivoMensual.objetivo_pm(anio, mes, vendedor, 5)
    total_ob_csi = ObjetivoMensual.objetivo_pm(anio, mes, vendedor, 3)
    total_op = CargaDiarium.carga_total_ob_mes_pm(anio, mes, vendedor, 7)
    total_pm = CargaDiarium.carga_total_ob_mes_pm(anio, mes, vendedor, 4)
    total_v = CargaDiarium.carga_total_ob_mes_pm(anio, mes, vendedor, 5)
    total_csi = CargaDiarium.carga_total_ob_mes_pm(anio, mes, vendedor, 3)
    totales[:ob_oportunidades] = total_ob_op
    totales[:ob_pruebas_manejo] = total_ob_pm
    totales[:ob_ventas] = total_ob_v
    totales[:ob_csi] = total_ob_csi
    totales[:oportunidades] = total_op
    totales[:pruebas_manejo] = total_pm
    totales[:ventas] = total_v
    totales[:calidad] = total_csi
    render json: totales.to_json
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
