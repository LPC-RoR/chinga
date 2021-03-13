class ClavesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_clave, only: %i[ show edit update destroy ]

  # GET /claves or /claves.json
  def index
    @coleccion = Clave.all
  end

  # GET /claves/1 or /claves/1.json
  def show
    @coleccion = {}
    @coleccion['elementos'] = @objeto.elementos.order(:titulo).page(params[:page])
  end

  # GET /claves/new
  def new
    @objeto = Clave.new
  end

  # GET /claves/1/edit
  def edit
  end

  # POST /claves or /claves.json
  def create
    @objeto = Clave.new(clave_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Clave was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claves/1 or /claves/1.json
  def update
    respond_to do |format|
      if @objeto.update(clave_params)
        format.html { redirect_to @objeto, notice: "Clave was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claves/1 or /claves/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to claves_url, notice: "Clave was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clave
      @objeto = Clave.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clave_params
      params.require(:clave).permit(:clave, :sha1, :orden)
    end
end
