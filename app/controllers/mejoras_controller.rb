class MejorasController < ApplicationController
  before_action :set_mejora, only: %i[ show edit update destroy ]

  # GET /mejoras or /mejoras.json
  def index
    @mejoras = Mejora.all
  end

  # GET /mejoras/1 or /mejoras/1.json
  def show
  end

  # GET /mejoras/new
  def new
    @mejora = Mejora.new
  end

  # GET /mejoras/1/edit
  def edit
  end

  # POST /mejoras or /mejoras.json
  def create
    @mejora = Mejora.new(mejora_params)

    respond_to do |format|
      if @mejora.save
        format.html { redirect_to @mejora, notice: "Mejora was successfully created." }
        format.json { render :show, status: :created, location: @mejora }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mejora.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mejoras/1 or /mejoras/1.json
  def update
    respond_to do |format|
      if @mejora.update(mejora_params)
        format.html { redirect_to @mejora, notice: "Mejora was successfully updated." }
        format.json { render :show, status: :ok, location: @mejora }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mejora.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mejoras/1 or /mejoras/1.json
  def destroy
    @mejora.destroy
    respond_to do |format|
      format.html { redirect_to mejoras_url, notice: "Mejora was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mejora
      @mejora = Mejora.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mejora_params
      params.require(:mejora).permit(:mejora, :detalle, :elemento_id, :owner_id)
    end
end
