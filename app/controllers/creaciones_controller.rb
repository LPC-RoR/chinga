class CreacionesController < ApplicationController
  before_action :set_creacion, only: %i[ show edit update destroy ]

  # GET /creaciones or /creaciones.json
  def index
    @creaciones = Creacion.all
  end

  # GET /creaciones/1 or /creaciones/1.json
  def show
  end

  # GET /creaciones/new
  def new
    @creacion = Creacion.new
  end

  # GET /creaciones/1/edit
  def edit
  end

  # POST /creaciones or /creaciones.json
  def create
    @creacion = Creacion.new(creacion_params)

    respond_to do |format|
      if @creacion.save
        format.html { redirect_to @creacion, notice: "Creacion was successfully created." }
        format.json { render :show, status: :created, location: @creacion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @creacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creaciones/1 or /creaciones/1.json
  def update
    respond_to do |format|
      if @creacion.update(creacion_params)
        format.html { redirect_to @creacion, notice: "Creacion was successfully updated." }
        format.json { render :show, status: :ok, location: @creacion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @creacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creaciones/1 or /creaciones/1.json
  def destroy
    @creacion.destroy
    respond_to do |format|
      format.html { redirect_to creaciones_url, notice: "Creacion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creacion
      @creacion = Creacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def creacion_params
      params.require(:creacion).permit(:autor_id, :elemento_id)
    end
end
