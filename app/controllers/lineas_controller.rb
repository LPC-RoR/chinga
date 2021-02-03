class LineasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_session
  before_action :set_linea, only: %i[ show edit update destroy ]

  # GET /lineas or /lineas.json
  def index
    @coleccion = Linea.all
  end

  # GET /lineas/1 or /lineas/1.json
  def show
  end

  # GET /lineas/new
  def new
    @objeto = Linea.new
  end

  # GET /lineas/1/edit
  def edit
  end

  # POST /lineas or /lineas.json
  def create
    @objeto = Linea.new(linea_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Linea was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lineas/1 or /lineas/1.json
  def update
    respond_to do |format|
      if @objeto.update(linea_params)
        format.html { redirect_to @objeto, notice: "Linea was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lineas/1 or /lineas/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to lineas_url, notice: "Linea was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linea
      @objeto = Linea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def linea_params
      params.require(:linea).permit(:linea, :ultima, :n_parrafo, :n_linea, :texto_id, :ultima_id)
    end
end
