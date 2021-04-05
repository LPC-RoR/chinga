class SoportesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_soporte, only: %i[ show edit update destroy ]

  # GET /soportes or /soportes.json
  def index
    @coleccion = Soporte.all
  end

  # GET /soportes/1 or /soportes/1.json
  def show
  end

  # GET /soportes/new
  def new
    padre = params[:class_name].constantize.find(params[:objeto_id])
    @objeto = padre.soportes.new(owner_id: session[:perfil_activo]['id'])
  end

  # GET /soportes/1/edit
  def edit
  end

  # POST /soportes or /soportes.json
  def create
    @objeto = Soporte.new(soporte_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Soporte was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /soportes/1 or /soportes/1.json
  def update
    respond_to do |format|
      if @objeto.update(soporte_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Soporte was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soportes/1 or /soportes/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Soporte was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soporte
      @objeto = Soporte.find(params[:id])
    end

    def set_redireccion
      @redireccion =  @objeto.perfil.present? ? '/perfiles/activo' : @objeto.elemento
    end

    # Only allow a list of trusted parameters through.
    def soporte_params
      params.require(:soporte).permit(:soporte, :owner_id, :link, :tipo_soporte_id, :perfil_id, :elemento_id, :imagen, :remove_imagen, :imagen_cache, :annio)
    end
end
