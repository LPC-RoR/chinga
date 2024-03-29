class Aplicacion::AdministradoresController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :set_administrador, only: %i[ show edit update destroy ]

  # GET /administradores or /administradores.json
  def index
    @coleccion = {}
    @coleccion['administradores'] = Administrador.all
  end

  # GET /administradores/1 or /administradores/1.json
  def show
  end

  # GET /administradores/new
  def new
    @objeto = Administrador.new
  end

  # GET /administradores/1/edit
  def edit
  end

  # POST /administradores or /administradores.json
  def create
    @objeto = Administrador.new(administrador_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Administrador was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administradores/1 or /administradores/1.json
  def update
    respond_to do |format|
      if @objeto.update(administrador_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Administrador was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administradores/1 or /administradores/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Administrador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrador
      @objeto = Administrador.find(params[:id])
    end

    def set_redireccion
      @redireccion = administradores_path
    end

    # Only allow a list of trusted parameters through.
    def administrador_params
      params.require(:administrador).permit(:administrador, :email, :usuario_id)
    end
end
