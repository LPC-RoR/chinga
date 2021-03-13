class ParticipantesController < ApplicationController
  before_action :set_participante, only: %i[ show edit update destroy ]

  # GET /participantes or /participantes.json
  def index
    @participantes = Participante.all
  end

  # GET /participantes/1 or /participantes/1.json
  def show
  end

  # GET /participantes/new
  def new
    @participante = Participante.new
  end

  # GET /participantes/1/edit
  def edit
  end

  # POST /participantes or /participantes.json
  def create
    @participante = Participante.new(participante_params)

    respond_to do |format|
      if @participante.save
        format.html { redirect_to @participante, notice: "Participante was successfully created." }
        format.json { render :show, status: :created, location: @participante }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @participante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participantes/1 or /participantes/1.json
  def update
    respond_to do |format|
      if @participante.update(participante_params)
        format.html { redirect_to @participante, notice: "Participante was successfully updated." }
        format.json { render :show, status: :ok, location: @participante }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @participante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participantes/1 or /participantes/1.json
  def destroy
    @participante.destroy
    respond_to do |format|
      format.html { redirect_to participantes_url, notice: "Participante was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participante
      @participante = Participante.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def participante_params
      params.require(:participante).permit(:perfil_id, :rueda_id)
    end
end
