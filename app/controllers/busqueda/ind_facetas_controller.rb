class Busqueda::IndFacetasController < ApplicationController
  before_action :set_ind_faceta, only: %i[ show edit update destroy ]

  # GET /ind_facetas or /ind_facetas.json
  def index
    @coleccion = IndFaceta.all
  end

  # GET /ind_facetas/1 or /ind_facetas/1.json
  def show
  end

  # GET /ind_facetas/new
  def new
    @objeto = IndFaceta.new
  end

  # GET /ind_facetas/1/edit
  def edit
  end

  # POST /ind_facetas or /ind_facetas.json
  def create
    @objeto = IndFaceta.new(ind_faceta_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Ind faceta was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ind_facetas/1 or /ind_facetas/1.json
  def update
    respond_to do |format|
      if @objeto.update(ind_faceta_params)
        format.html { redirect_to @objeto, notice: "Ind faceta was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ind_facetas/1 or /ind_facetas/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to ind_facetas_url, notice: "Ind faceta was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ind_faceta
      @objeto = IndFaceta.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ind_faceta_params
      params.require(:ind_faceta).permit(:ind_estructura_id, :ind_faceta, :faceta)
    end
end
