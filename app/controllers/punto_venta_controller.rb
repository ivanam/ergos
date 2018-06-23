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

    if params[:anio] == "" or params[:anio] == nil
      ani=Date.today.year
      @anio=ani.to_i
    else
      ani=params[:anio]
      @anio=ani.to_i
    end
    if params[:mes] == "" or params[:mes] == nil
        me=Date.today.month
        @mes=me.to_i
    else
      me=params[:mes]
      @mes=me.to_i
    end
    if params[:semana] == "" or params[:semana] == nil
      di=Date.today.day
      @dia=di.to_i
      sem =CargaDiarium.calcularSemana(@anio,@mes,@dia)
      @semana = sem.to_i
    else
      sem=params[:semana]
      @semana = sem.to_i
    end
    #preguntar si es principio de mes...lamar a ranking

    @sidebar = true
    @footer = false
    @bg_gray = false
    @punto_venta = PuntoVentum.where(:id => current_user.punto_venta_id).first

    @vendedores = Vendedor.where(:punto_venta_id => @punto_venta.id).where('baja is null or baja = false') #solo vendedores activos
    @v = Vendedor.where(:punto_venta_id => @punto_venta.id).first
    
    @concesionarium = Concesionarium.where(:id => @punto_venta.concesionaria_id).first
    if Date.today.day == 1
      fecha_anterior=Date.new(@anio,@mes,1) - 1.month
      mes_anterior= fecha_anterior.month
      lista = []
      posicion = 1
       @vendedores.each do |ve|
          rank = CargaDiarium.SumaObMensualVendedor(@anio,mes_anterior,ve,"VENTAS")
          lista << [rank,ve]
        end
        listOrdenada=lista.sort.reverse
        listOrdenada.each do |l|
          vendedor = Vendedor.where(:id => l[1].id).first
          vendedor.avance = posicion
          vendedor.save
          posicion =+ posicion + 1
        end
    end
    #fecha_anterior=Time.now - 1.month
    @rankingVendedores =  @vendedores.order(avance: :asc)
  end

  def ranking 
    if params[:mes] != "" and params[:anio] != ""
      fecha_anterior=Date.new(params[:anio],params[:mes],1) - 1.month
      mes_anterior= fecha_anterior.month
    else
      fecha_anterior=Date.today - 1.month
      mes_anterior= fecha_anterior.month
    end
    if params[:anio] != ""
      anio = params[:anio]
    else
      anio = Date.today.year
    end
    @punto_venta = PuntoVentum.where(:id => current_user.punto_venta_id).first
    @vendedores = Vendedor.where(:punto_venta_id => @punto_venta.id).where('baja is null or baja = false')
    lista = []
    posicion = 1
     @vendedores.each do |ve|
        rank = CargaDiarium.SumaObMensualVendedor(anio,mes_anterior,ve,"VENTAS")
        lista << [rank,ve]
      end
      listOrdenada=lista.sort.reverse
      listOrdenada.each do |l|
        vendedor = Vendedor.where(:id => l[1].id).first
        vendedor.avance = posicion
        vendedor.save
        posicion =+ posicion + 1
      end
      
      @rankingVendedores =  @vendedores.order(avance: :asc)
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
