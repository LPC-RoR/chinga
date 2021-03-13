class RuedasController < ApplicationController
  before_action :set_rueda, only: %i[ show edit update destroy ]

  # GET /ruedas or /ruedas.json
  def index
    @ruedas = Rueda.all
  end

  # GET /ruedas/1 or /ruedas/1.json
  def show
  end

  # GET /ruedas/new
  def new
    @rueda = Rueda.new
  end

  # GET /ruedas/1/edit
  def edit
  end

  # POST /ruedas or /ruedas.json
  def create
    @rueda = Rueda.new(rueda_params)

    respond_to do |format|
      if @rueda.save
        format.html { redirect_to @rueda, notice: "Rueda was successfully created." }
        format.json { render :show, status: :created, location: @rueda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rueda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ruedas/1 or /ruedas/1.json
  def update
    respond_to do |format|
      if @rueda.update(rueda_params)
        format.html { redirect_to @rueda, notice: "Rueda was successfully updated." }
        format.json { render :show, status: :ok, location: @rueda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rueda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ruedas/1 or /ruedas/1.json
  def destroy
    @rueda.destroy
    respond_to do |format|
      format.html { redirect_to ruedas_url, notice: "Rueda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rueda
      @rueda = Rueda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rueda_params
      params.require(:rueda).permit(:administrador_id, :rueda, :ubicacion, :invitacion)
    end
end
