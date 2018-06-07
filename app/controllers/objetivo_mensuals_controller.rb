class ObjetivoMensualsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_objetivo_mensual, only: [:show, :edit, :update, :destroy]

  # GET /objetivo_mensuals
  # GET /objetivo_mensuals.json
  def index
    @objetivo_mensuals = ObjetivoMensual.where(punto_venta_id: current_user.punto_venta_id).order(:anio, :mes, :tipo_objetivo_id)
  end

  # GET /objetivo_mensuals/1
  # GET /objetivo_mensuals/1.json
  def show
  end

  # GET /objetivo_mensuals/new
  def new
    @objetivo_mensual = ObjetivoMensual.new(punto_venta_id: current_user.punto_venta_id)
  end

  # GET /objetivo_mensuals/1/edit
  def edit
  end

  # POST /objetivo_mensuals
  # POST /objetivo_mensuals.json
  def create
    @objetivo_mensual = ObjetivoMensual.new(objetivo_mensual_params)
    @objetivo_mensual.mes = params[:date][:mes]
    @objetivo_mensual.anio = params[:date][:anio]
    if @objetivo_mensual.tipo_objetivo_id != nil
      descpOb = TipoObjetivo.find(@objetivo_mensual.tipo_objetivo_id).descripcion
      vendedores = Vendedor.where(punto_venta_id: @objetivo_mensual.punto_venta_id)
    end
    
    @objetivo_mensual.user_id = current_user.id
    respond_to do |format|
      if @objetivo_mensual.save
          if (descpOb == "CSI" && @objetivo_mensual.csi_real == nil)
            vendedores.each do |vendedores|
             objetivo_mensual_v = ObjetivoMensual.new(objetivo_mensual_params)
             objetivo_mensual_v.vendedor_id = vendedores.id
             objetivo_mensual_v.user_id = current_user.id
             objetivo_mensual_v.mes = params[:date][:mes]
             objetivo_mensual_v.anio = params[:date][:anio]
             objetivo_mensual_v.save
             end
          end
          format.html { redirect_to @objetivo_mensual, notice: 'Objetivo mensual creado con exito.' }
          format.json { render :show, status: :created, location: @objetivo_mensual }
      else
          format.html { render :new }
          format.json { render json: @objetivo_mensual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objetivo_mensuals/1
  # PATCH/PUT /objetivo_mensuals/1.json
  def update
    respond_to do |format|
      if @objetivo_mensual.update(objetivo_mensual_params)
        format.html { redirect_to @objetivo_mensual, notice: 'Objetivo mensual modificado con exito.' }
        format.json { render :show, status: :ok, location: @objetivo_mensual }
      else
        format.html { render :edit }
        format.json { render json: @objetivo_mensual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objetivo_mensuals/1
  # DELETE /objetivo_mensuals/1.json
  def destroy
    @objetivo_mensual.destroy
    respond_to do |format|
      format.html { redirect_to objetivo_mensuals_url, notice: 'Objetivo mensual eliminado con exito.' }
      format.json { head :no_content }
    end
  end

  def actualizar_objetivos
    mes = params[:mes]
    anio = params[:anio]
    vendedor_id = params[:vendedor][:id]
    cantidad_op = params[:oportunidades]
    cantidad_pm = params[:pruebas_manejo]
    cantidad_v = params[:ventas]
    cantidad_f = params[:financiaciones]
    cantidad_c = params[:calidad]    
    objetivo_op = ObjetivoMensual.find_by(mes: mes, anio: anio, vendedor_id: vendedor_id, tipo_objetivo_id: 7)
    msj = ''
    errores = Hash.new
    if cantidad_op.to_i != 0 && objetivo_op != nil
      objetivo_op.cantidad_propuesta = cantidad_op
      if objetivo_op.save        
        msj += ' Oportunidades '
      else
        errores[:oportunidades] = "Oportunidades: #{objetivo_op.errors.full_messages.first}"
      end
    end
    objetivo_pm = ObjetivoMensual.find_by(mes: mes, anio: anio, vendedor_id: vendedor_id, tipo_objetivo_id: 4)
    if cantidad_pm.to_i != 0 && objetivo_pm != nil
      objetivo_pm.cantidad_propuesta = cantidad_pm
      if objetivo_pm.save
        msj += ' Pruebas de manejo '
      else
        errores[:pruebas_manejo] = "Pruebas de manejo: #{objetivo_op.errors.full_messages.first}"
      end
    end
    objetivo_v = ObjetivoMensual.find_by(mes: mes, anio: anio, vendedor_id: vendedor_id, tipo_objetivo_id: 5)
    if cantidad_v.to_i != 0 && objetivo_v != nil
      objetivo_v.cantidad_propuesta = cantidad_v
      if objetivo_v.save
        msj += ' Ventas '
      else
        errores[:ventas] = "Ventas: #{objetivo_op.errors.full_messages.first}"
      end
    end
    objetivo_f = ObjetivoMensual.find_by(mes: mes, anio: anio, vendedor_id: vendedor_id, tipo_objetivo_id: 8)
    if cantidad_f.to_i != 0 && objetivo_f != nil
      objetivo_f.cantidad_propuesta = cantidad_f
      if objetivo_f.save
        msj += ' Financiaciones '
      else
        errores[:financiaciones] = "Financiaciones: #{objetivo_op.errors.full_messages.first}"
      end
    end
    objetivo_c = ObjetivoMensual.find_by(mes: mes, anio: anio, vendedor_id: vendedor_id, tipo_objetivo_id: 3)
    if cantidad_c.to_i != 0 && objetivo_c != nil
      objetivo_c.cantidad_propuesta = cantidad_c
      if objetivo_c.save
        msj += ' Calidad '
      else
        errores[:calidad] = "Calidad: #{objetivo_op.errors.full_messages.first}"
      end
    end
    if msj == ''
      msj = 'No se actualizo ningun dato'
    else
      msj = 'Se actualizaron los valores de '+msj
    end
    respond_to do |format|
      if errores.blank?
        format.html { redirect_to "/vendedors/#{vendedor_id}", notice: msj }
        format.json { head :no_content }
      else
        format.html { redirect_to "/vendedors/#{vendedor_id}", alert: errores }
        format.json { render json: errores, status: :unprocessable_entity }
      end
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objetivo_mensual
      @objetivo_mensual = ObjetivoMensual.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objetivo_mensual_params
      params.require(:objetivo_mensual).permit(:descripcion, :fecha_creacion, :tipo_objetivo_id, :cantidad_propuesta, :mes, :anio, :user_id, :vendedor_id, :punto_venta_id, :csi_real)
    end
end
