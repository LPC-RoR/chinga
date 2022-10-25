class Aplicacion::PerfilesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :set_perfil, only: %i[ show edit update destroy ]

  require 'yaml'

  include ProcesaEstructura
  include ProcesaElemento

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

  def proceso

#    ingresos = Elemento.where(estado: 'ingreso')
#    ingresos.each do |ele|
#      ele.estado = 'publicada'
#      ele.save
#    end

#    diccionario = YAML.load_file('diccionario.yml')
#    puts config['last_update'] #in my file this is set to "some data"
#    diccionario = [IndPalabra::E_ESPANOL, IndPalabra::E_INGLES, IndPalabra::NUMBERS, IndPalabra::EXCEPTIONS]

#    diccionario = {}
#    diccionario['e_espanol']  = IndPalabra::E_ESPANOL
#    diccionario['e_ingles']   = IndPalabra::E_INGLES
#    diccionario['numbers']    = IndPalabra::NUMBERS
#    diccionario['exceptions'] = IndPalabra::EXCEPTIONS
#    File.open('config/diccionario.yml','w') do |h| 
#       h.write diccionario.to_yaml
#    end
    IndPalabra.delete_all
    IndClave.delete_all
    IndFaceta.delete_all
    IndIndice.delete_all

    Elemento.all.each do |elemento|
      procesa_elemento(elemento)
      indexa_registro(elemento)
    end

    redirect_to root_path
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
