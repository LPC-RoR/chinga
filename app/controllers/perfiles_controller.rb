class PerfilesController < ApplicationController
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
  end

  # GET /perfiles/new
  def new
    @objeto = Perfil.new
  end

  # GET /perfiles/1/edit
  def edit
  end

  # POST /perfiles or /perfiles.json
  def create
    @objeto = Perfil.new(perfil_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Perfil was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfiles/1 or /perfiles/1.json
  def update
    respond_to do |format|
      if @objeto.update(perfil_params)
        format.html { redirect_to @objeto, notice: "Perfil was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfiles/1 or /perfiles/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to perfiles_url, notice: "Perfil was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil
      @objeto = Perfil.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perfil_params
      params.require(:perfil).permit(:email, :usuario_id, :administrador_id)
    end
end
