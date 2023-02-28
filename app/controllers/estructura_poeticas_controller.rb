class EstructuraPoeticasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :set_estructura_poetica, only: %i[ show edit update destroy ]

  # GET /estructura_poeticas or /estructura_poeticas.json
  def index
    @coleccion = EstructuraPoetica.all
  end

  # GET /estructura_poeticas/1 or /estructura_poeticas/1.json
  def show
  end

  # GET /estructura_poeticas/new
  def new
    @objeto = EstructuraPoetica.new(owner_id: perfil_activo_id)
  end

  # GET /estructura_poeticas/1/edit
  def edit
  end

  # POST /estructura_poeticas or /estructura_poeticas.json
  def create
    @objeto = EstructuraPoetica.new(estructura_poetica_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Estructura poetica was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estructura_poeticas/1 or /estructura_poeticas/1.json
  def update
    respond_to do |format|
      if @objeto.update(estructura_poetica_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Estructura poetica was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estructura_poeticas/1 or /estructura_poeticas/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Estructura poetica was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estructura_poetica
      @objeto = EstructuraPoetica.find(params[:id])
    end

    def set_redireccion
      @redireccion = parametros_path
    end

    # Only allow a list of trusted parameters through.
    def estructura_poetica_params
      params.require(:estructura_poetica).permit(:estructura_poetica, :owner_id)
    end
end
