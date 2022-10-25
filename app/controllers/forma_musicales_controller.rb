class FormaMusicalesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :set_forma_musical, only: %i[ show edit update destroy ]

  # GET /forma_musicales or /forma_musicales.json
  def index
    @coleccion = FormaMusical.all
  end

  # GET /forma_musicales/1 or /forma_musicales/1.json
  def show
  end

  # GET /forma_musicales/new
  def new
    @objeto = FormaMusical.new(owner_id: session[:perfil_activo]['id'])
  end

  # GET /forma_musicales/1/edit
  def edit
  end

  # POST /forma_musicales or /forma_musicales.json
  def create
    @objeto = FormaMusical.new(forma_musical_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Forma musical was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forma_musicales/1 or /forma_musicales/1.json
  def update
    respond_to do |format|
      if @objeto.update(forma_musical_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Forma musical was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forma_musicales/1 or /forma_musicales/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Forma musical was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forma_musical
      @objeto = FormaMusical.find(params[:id])
    end

    def set_redireccion
      @redireccion = parametros_path
    end

    # Only allow a list of trusted parameters through.
    def forma_musical_params
      params.require(:forma_musical).permit(:forma_musical, :owner_id)
    end
end
