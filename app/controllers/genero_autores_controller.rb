class GeneroAutoresController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_genero_autor, only: %i[ show edit update destroy ]

  # GET /genero_autores or /genero_autores.json
  def index
    @coleccion = GeneroAutor.all
  end

  # GET /genero_autores/1 or /genero_autores/1.json
  def show
  end

  # GET /genero_autores/new
  def new
    @objeto = GeneroAutor.new(owner_id: session[:perfil_activo]['id'])
  end

  # GET /genero_autores/1/edit
  def edit
  end

  # POST /genero_autores or /genero_autores.json
  def create
    @objeto = GeneroAutor.new(genero_autor_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Genero autor was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genero_autores/1 or /genero_autores/1.json
  def update
    respond_to do |format|
      if @objeto.update(genero_autor_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Genero autor was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genero_autores/1 or /genero_autores/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Genero autor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genero_autor
      @objeto = GeneroAutor.find(params[:id])
    end

    def set_redireccion
      @redireccion = parametros_path
    end

    # Only allow a list of trusted parameters through.
    def genero_autor_params
      params.require(:genero_autor).permit(:genero_autor, :owner_id)
    end
end
