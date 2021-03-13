class InterpretesController < ApplicationController
  before_action :set_interprete, only: %i[ show edit update destroy ]

  # GET /interpretes or /interpretes.json
  def index
    @interpretes = Interprete.all
  end

  # GET /interpretes/1 or /interpretes/1.json
  def show
  end

  # GET /interpretes/new
  def new
    @interprete = Interprete.new
  end

  # GET /interpretes/1/edit
  def edit
  end

  # POST /interpretes or /interpretes.json
  def create
    @interprete = Interprete.new(interprete_params)

    respond_to do |format|
      if @interprete.save
        format.html { redirect_to @interprete, notice: "Interprete was successfully created." }
        format.json { render :show, status: :created, location: @interprete }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interprete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interpretes/1 or /interpretes/1.json
  def update
    respond_to do |format|
      if @interprete.update(interprete_params)
        format.html { redirect_to @interprete, notice: "Interprete was successfully updated." }
        format.json { render :show, status: :ok, location: @interprete }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interprete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interpretes/1 or /interpretes/1.json
  def destroy
    @interprete.destroy
    respond_to do |format|
      format.html { redirect_to interpretes_url, notice: "Interprete was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interprete
      @interprete = Interprete.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interprete_params
      params.require(:interprete).permit(:interprete, :perfil_id)
    end
end
