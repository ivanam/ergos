class UserPuntoVentaController < ApplicationController
  before_action :set_user_punto_ventum, only: [:show, :edit, :update, :destroy]

  # GET /user_punto_venta
  # GET /user_punto_venta.json
  def index
    @user_punto_venta = UserPuntoVentum.all
  end

  # GET /user_punto_venta/1
  # GET /user_punto_venta/1.json
  def show
  end

  # GET /user_punto_venta/new
  def new
    @user_punto_ventum = UserPuntoVentum.new
  end

  # GET /user_punto_venta/1/edit
  def edit
  end

  # POST /user_punto_venta
  # POST /user_punto_venta.json
  def create
    @user_punto_ventum = UserPuntoVentum.new(user_punto_ventum_params)

    respond_to do |format|
      if @user_punto_ventum.save
        format.html { redirect_to @user_punto_ventum, notice: 'User punto ventum was successfully created.' }
        format.json { render :show, status: :created, location: @user_punto_ventum }
      else
        format.html { render :new }
        format.json { render json: @user_punto_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_punto_venta/1
  # PATCH/PUT /user_punto_venta/1.json
  def update
    respond_to do |format|
      if @user_punto_ventum.update(user_punto_ventum_params)
        format.html { redirect_to @user_punto_ventum, notice: 'User punto ventum was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_punto_ventum }
      else
        format.html { render :edit }
        format.json { render json: @user_punto_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_punto_venta/1
  # DELETE /user_punto_venta/1.json
  def destroy
    @user_punto_ventum.destroy
    respond_to do |format|
      format.html { redirect_to user_punto_venta_url, notice: 'User punto ventum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_punto_ventum
      @user_punto_ventum = UserPuntoVentum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_punto_ventum_params
      params.require(:user_punto_ventum).permit(:user_id, :punto_venta_id)
    end
end
