class UltimasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_session
  before_action :set_ultima, only: %i[ show edit update destroy ]

  # GET /ultimas or /ultimas.json
  def index
    @coleccion = Ultima.all
  end

  # GET /ultimas/1 or /ultimas/1.json
  def show
  end

  # GET /ultimas/new
  def new
    @objeto = Ultima.new
  end

  # GET /ultimas/1/edit
  def edit
  end

  # POST /ultimas or /ultimas.json
  def create
    @objeto = Ultima.new(ultima_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Ultima was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ultimas/1 or /ultimas/1.json
  def update
    respond_to do |format|
      if @objeto.update(ultima_params)
        format.html { redirect_to @objeto, notice: "Ultima was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ultimas/1 or /ultimas/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to ultimas_url, notice: "Ultima was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ultima
      @objeto = Ultima.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ultima_params
      params.require(:ultima).permit(:ultima, :sha1)
    end
end
