class EvaluacionesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_session
  before_action :set_evaluacion, only: %i[ show edit update destroy ]

  # GET /evaluaciones or /evaluaciones.json
  def index
    @coleccion = Evaluacion.all
  end

  # GET /evaluaciones/1 or /evaluaciones/1.json
  def show
  end

  # GET /evaluaciones/new
  def new
    @objeto = Evaluacion.new
  end

  # GET /evaluaciones/1/edit
  def edit
  end

  # POST /evaluaciones or /evaluaciones.json
  def create
    @objeto = Evaluacion.new(evaluacion_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Evaluacion was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluaciones/1 or /evaluaciones/1.json
  def update
    respond_to do |format|
      if @objeto.update(evaluacion_params)
        format.html { redirect_to @objeto, notice: "Evaluacion was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluaciones/1 or /evaluaciones/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to evaluaciones_url, notice: "Evaluacion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluacion
      @objeto = Evaluacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def evaluacion_params
      params.require(:evaluacion).permit(:aspecto, :evaluacion, :elemento_id, :perfil_id)
    end
end
