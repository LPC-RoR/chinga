class HerenciasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_herencia, only: %i[ show edit update destroy ]

  # GET /herencias or /herencias.json
  def index
    @coleccion = Herencia.all
  end

  # GET /herencias/1 or /herencias/1.json
  def show
  end

  # GET /herencias/new
  def new
    @objeto = Herencia.new
  end

  # GET /herencias/1/edit
  def edit
  end

  # POST /herencias or /herencias.json
  def create
    @objeto = Herencia.new(herencia_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Herencia was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /herencias/1 or /herencias/1.json
  def update
    respond_to do |format|
      if @objeto.update(herencia_params)
        format.html { redirect_to @objeto, notice: "Herencia was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /herencias/1 or /herencias/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to herencias_url, notice: "Herencia was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_herencia
      @objeto = Herencia.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def herencia_params
      params.require(:herencia).permit(:equipo_id, :carpeta_id)
    end
end
