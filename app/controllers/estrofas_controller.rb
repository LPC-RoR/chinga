class EstrofasController < ApplicationController
  before_action :set_estrofa, only: %i[ show edit update destroy ]

  # GET /estrofas or /estrofas.json
  def index
    @estrofas = Estrofa.all
  end

  # GET /estrofas/1 or /estrofas/1.json
  def show
  end

  # GET /estrofas/new
  def new
    @estrofa = Estrofa.new
  end

  # GET /estrofas/1/edit
  def edit
  end

  # POST /estrofas or /estrofas.json
  def create
    @estrofa = Estrofa.new(estrofa_params)

    respond_to do |format|
      if @estrofa.save
        format.html { redirect_to @estrofa, notice: "Estrofa was successfully created." }
        format.json { render :show, status: :created, location: @estrofa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estrofa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estrofas/1 or /estrofas/1.json
  def update
    respond_to do |format|
      if @estrofa.update(estrofa_params)
        format.html { redirect_to @estrofa, notice: "Estrofa was successfully updated." }
        format.json { render :show, status: :ok, location: @estrofa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estrofa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estrofas/1 or /estrofas/1.json
  def destroy
    @estrofa.destroy
    respond_to do |format|
      format.html { redirect_to estrofas_url, notice: "Estrofa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estrofa
      @estrofa = Estrofa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estrofa_params
      params.require(:estrofa).permit(:n_estrofa)
    end
end
