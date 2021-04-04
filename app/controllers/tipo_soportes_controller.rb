class TipoSoportesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_tipo_soporte, only: %i[ show edit update destroy ]

  # GET /tipo_soportes or /tipo_soportes.json
  def index
    @coleccion = TipoSoporte.all
  end

  # GET /tipo_soportes/1 or /tipo_soportes/1.json
  def show
  end

  # GET /tipo_soportes/new
  def new
    @objeto = TipoSoporte.new(owner_id: session[:perfil_activo]['id'])
  end

  # GET /tipo_soportes/1/edit
  def edit
  end

  # POST /tipo_soportes or /tipo_soportes.json
  def create
    @objeto = TipoSoporte.new(tipo_soporte_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Tipo soporte was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_soportes/1 or /tipo_soportes/1.json
  def update
    respond_to do |format|
      if @objeto.update(tipo_soporte_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Tipo soporte was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_soportes/1 or /tipo_soportes/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Tipo soporte was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_soporte
      @objeto = TipoSoporte.find(params[:id])
    end

    def set_redireccion
      @redireccion = parametros_path
    end

    # Only allow a list of trusted parameters through.
    def tipo_soporte_params
      params.require(:tipo_soporte).permit(:tipo_soporte, :owner_id)
    end
end
