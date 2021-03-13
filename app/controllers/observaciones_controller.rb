class ObservacionesController < ApplicationController
  before_action :set_observacion, only: %i[ show edit update destroy ]

  # GET /observaciones or /observaciones.json
  def index
    @observaciones = Observacion.all
  end

  # GET /observaciones/1 or /observaciones/1.json
  def show
  end

  # GET /observaciones/new
  def new
    @observacion = Observacion.new
  end

  # GET /observaciones/1/edit
  def edit
  end

  # POST /observaciones or /observaciones.json
  def create
    @observacion = Observacion.new(observacion_params)

    respond_to do |format|
      if @observacion.save
        format.html { redirect_to @observacion, notice: "Observacion was successfully created." }
        format.json { render :show, status: :created, location: @observacion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @observacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /observaciones/1 or /observaciones/1.json
  def update
    respond_to do |format|
      if @observacion.update(observacion_params)
        format.html { redirect_to @observacion, notice: "Observacion was successfully updated." }
        format.json { render :show, status: :ok, location: @observacion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @observacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observaciones/1 or /observaciones/1.json
  def destroy
    @observacion.destroy
    respond_to do |format|
      format.html { redirect_to observaciones_url, notice: "Observacion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_observacion
      @observacion = Observacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def observacion_params
      params.require(:observacion).permit(:observacion, :detalle, :elemento_id, :owner_id)
    end
end
