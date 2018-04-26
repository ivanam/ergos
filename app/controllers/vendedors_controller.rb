class VendedorsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_vendedor, only: [:show, :edit, :update, :destroy]

  # GET /vendedors
  # GET /vendedors.json
  def index
    @vendedors = Vendedor.all
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

    @vendedor = Vendedor.new()
    if  Persona.where(:numero_documento => params[:dni]).first == nil
      @persona = Persona.create(:numero_documento => params[:dni], :tipo_documento_id => params[:tipo_documento], :cuit => params[:cuit], :apellido => params[:apellido], :nombre => params[:Nombre], :domicilio => params[:Domicilio], :telefono => params[:telefono], :fecha_nacimiento =>params[:vendedor][:fecha_nacimiento], email: params[:email])
      @persona.save
    else
      @persona= Persona.where(:numero_documento => params[:dni]).first
      @persona.tipo_documento_id=params[:tipo_documento]
      @persona.cuit=params[:cuit]
      @persona.apellido=params[:apellido]
      @persona.nombre=params[:Nombre]
      @persona.domicilio=params[:Domicilio]
      @persona.telefono=params[:telefono]
      @persona.fecha_nacimiento=params[:vendedor][:fecha_nacimiento]
      @persona.email= params[:email]
      @persona.save
    end
    if User.where(:email => params[:email]).first == nil
      @usuario =User.create(email: params[:email], password: params[:pass])
      @usuario.add_role "vendedor"
      @usuario.persona_id=@persona.id
    else
       @usuario = User.create(:email => params[:email])
       @usuario.email = params[:email]
       @usuario.password = params[:pass]
    end
    #el numero de vendedor debe ser unico
    if Vendedor.where(:numero => params[:vendedor][:numero]).first == nil

        @vendedor.numero=params[:vendedor][:numero].to_i
        @vendedor.fecha_alta=params[:vendedor][:fecha_alta]
        @vendedor.fecha_alta=params[:vendedor][:fecha_baja]

        respond_to do |format|
             @vendedor.persona_id=@persona.id
             @usuario.persona_id=@persona.id
             if @usuario.save
                 if @vendedor.save!
                    format.html { redirect_to @vendedor, notice: 'Vendedor was successfully created.' }
                    format.json { render :show, status: :created, location: @vendedor }
                 else
                    @vendedor.errors[:messages]<< "Errores en el formulario"
                    format.html { render :new }
                    format.json { render json: @vendedor.errors, status: :unprocessable_entity }
                 end
            else
               @usuario.errors[:messages]<< "Ya existe el correo electrónico"
               format.json { render json: @usuario.errors, status: :unprocessable_entity }
               format.html { render :new  }
            end

        end
    else
      respond_to do |format|
        @vendedor.errors[:messages]<< "Ya existe un vendedor con ese número"
        format.html { render :new }
        format.json { render json: @vendedor.errors, status: :unprocessable_entity, message: "El vendedor ya existe" }
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
      params.require(:vendedor).permit(:foto, :numero, :fecha_alta, :fecha_baja, :persona_id)
    end
end
