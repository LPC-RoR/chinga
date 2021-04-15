class Aplicacion::PerfilesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_perfil, only: %i[ show edit update destroy ]

  # GET /perfiles or /perfiles.json
  def index
    @coleccion = Perfil.all
  end

  def activo
    @objeto = Perfil.find(session[:perfil_activo]['id'])

    @coleccion = {}

    # ******************************** LISTAS ********************************
    @coleccion['listas'] = @objeto.listas.order(:lista)
    @coleccion['soportes'] = @objeto.soportes.order(:soporte)
#    @coleccion['rondas'] = @objeto.rondas

    # ******************************** EQUIPOS ********************************
    if params[:html_options].blank?
      @tab = 'Administrados'
    else
      @tab = params[:html_options][:tab].blank? ? 'Administrados' : params[:html_options][:tab]
    end

    @coleccion['equipos'] = (@tab == 'Administrados') ? @objeto.equipos : @objeto.participaciones

    @options = {'tab' => @tab}

  end

  # GET /perfiles/1 or /perfiles/1.json
  def show
    #@objeto = Perfil.find(session[:perfil_activo]['id'])

    @coleccion = {}

    # ******************************** LISTAS ********************************
    @coleccion['listas'] = @objeto.listas.order(:lista)
    @coleccion['soportes'] = @objeto.soportes.order(:soporte)
  end

  # GET /perfiles/new
  def new
    @objeto = Perfil.new
  end

  # GET /perfiles/1/edit
  def edit
  end

  # PATCH/PUT /perfiles/1 or /perfiles/1.json
  def update
    respond_to do |format|
      if @objeto.update(perfil_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Perfil was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil
      @objeto = Perfil.find(params[:id])
    end

    def set_redireccion
      @redireccion = activo_perfiles_path
    end

    # Only allow a list of trusted parameters through.
    def perfil_params
      params.require(:perfil).permit(:email, :usuario_id, :administrador_id, :nombre, :usuario, :presentacion, :facebook, :instagram, :imagen, :remove_imagen, :imagen_cache)
    end
end
