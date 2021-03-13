class RegistrosController < ApplicationController
  before_action :set_registro, only: %i[ show edit update destroy ]

  # GET /registros or /registros.json
  def index
    @registros = Registro.all
  end

  # GET /registros/1 or /registros/1.json
  def show
  end

  # GET /registros/new
  def new
    @registro = Registro.new
  end

  # GET /registros/1/edit
  def edit
  end

  # POST /registros or /registros.json
  def create
    @registro = Registro.new(registro_params)

    respond_to do |format|
      if @registro.save
        format.html { redirect_to @registro, notice: "Registro was successfully created." }
        format.json { render :show, status: :created, location: @registro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registros/1 or /registros/1.json
  def update
    respond_to do |format|
      if @registro.update(registro_params)
        format.html { redirect_to @registro, notice: "Registro was successfully updated." }
        format.json { render :show, status: :ok, location: @registro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registros/1 or /registros/1.json
  def destroy
    @registro.destroy
    respond_to do |format|
      format.html { redirect_to registros_url, notice: "Registro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registro
      @registro = Registro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registro_params
      params.require(:registro).permit(:interprete_id, :elemento_id)
    end
end
