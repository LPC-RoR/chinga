class Aplicacion::ComentariosController < ApplicationController
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_comentario, only: %i[ show edit update destroy ]

  # GET /comentarios or /comentarios.json
  def index
    @coleccion = Comentario.all
  end

  # GET /comentarios/1 or /comentarios/1.json
  def show
  end

  # GET /comentarios/new
  def new
    case params[:class_name]
    when 'Elemento'
      padre = Elemento.find(params[:objeto_id]) unless params[:objeto_id].blank?
    end

    @objeto = padre.comentarios.new(owner_id: session[:perfil_activo]['id'])
  end

  # GET /comentarios/1/edit
  def edit
  end

  # POST /comentarios or /comentarios.json
  def create
    @objeto = Comentario.new(comentario_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Comentario was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentarios/1 or /comentarios/1.json
  def update
    respond_to do |format|
      if @objeto.update(comentario_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Comentario was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1 or /comentarios/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Comentario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @objeto = Comentario.find(params[:id])
    end

    def set_redireccion
      @redireccion = @objeto.elemento
    end

    # Only allow a list of trusted parameters through.
    def comentario_params
      params.require(:comentario).permit(:comentario, :detalle, :elemento_id, :owner_id)
    end
end
