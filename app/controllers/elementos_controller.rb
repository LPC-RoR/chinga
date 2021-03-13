class ElementosController < ApplicationController
  before_action :authenticate_usuario!, except: :show
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_elemento, only: %i[ show edit update destroy estado ]

  # GET /elementos or /elementos.json
  def index
    @coleccion = Elemento.all
  end

  # GET /elementos/1 or /elementos/1.json
  def show
    if usuario_signed_in?
      @activo = Perfil.find(session[:perfil_activo]['id'])

      @coleccion = {}
      @coleccion['listas'] = @objeto.listas

      @listas_seleccion = Lista.find(@activo.listas.ids - @objeto.listas.ids)
    end
  end

  # GET /elementos/new
  def new
    @activo = Perfil.find(session[:perfil_activo]['id'])
    @objeto = @activo.contribuciones.new(estado: 'ingreso')

    @genero_autores = GeneroAutor.all.order(:genero_autor).map {|ga| ga.genero_autor}
    @forma_musicales = FormaMusical.all.order(:forma_musical).map {|fm| fm.forma_musical}
    @estructura_poeticas = EstructuraPoetica.all.order(:estructura_poetica).map {|ep| ep.estructura_poetica}
    @soportes = Soporte.all.order(:soporte).map {|sop| sop.soporte}
  end

  # GET /elementos/1/edit
  def edit
    @genero_autores = GeneroAutor.all.order(:genero_autor).map {|ga| ga.genero_autor}
    @forma_musicales = FormaMusical.all.order(:forma_musical).map {|fm| fm.forma_musical}
    @estructura_poeticas = EstructuraPoetica.all.order(:estructura_poetica).map {|ep| ep.estructura_poetica}
    @soportes = Soporte.all.order(:soporte).map {|sop| sop.soporte}
  end

  # POST /elementos or /elementos.json
  def create
    @objeto = Elemento.new(elemento_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Elemento was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elementos/1 or /elementos/1.json
  def update
    respond_to do |format|
      if @objeto.update(elemento_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Elemento was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  def estado
    # @objeto = ELEMENTO
    @activo = Perfil.find(session[:perfil_activo]['id'])

    if params[:estado] == 'eliminado'
      @objeto.delete
    elsif ['correccion', 'ingreso'].include?(params[:estado])
        @objeto.estado = 'ingreso'
#        @objeto.unicidad = 'unico'
        @objeto.save
    elsif params[:estado] == 'multiple'
      @objeto.estado = 'publicada'
      @objeto.unicidad = 'multiple'
      @objeto.save
    elsif params[:estado] == 'papelera'
      if @objeto.listas.any?
        @objeto.listas.each do |lst|
          @objeto.listas.delete(lst)
        end
      end
      @objeto.estado = params[:estado]
      @objeto.save
    else
      @objeto.estado = params[:estado]
      @objeto.save
    end

    redirect_to @objeto
  end

  # DELETE /elementos/1 or /elementos/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Elemento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elemento
      @objeto = Elemento.find(params[:id])
    end

    def set_redireccion
      if @objeto.estado == 'ingreso'
        @redireccion = contribuciones_path
      else
        @redireccion = vistas_path
      end
    end

    # Only allow a list of trusted parameters through.
    def elemento_params
      params.require(:elemento).permit(:titulo, :letra, :autor, :genero_autor, :pais, :ciudad_autor, :interprete, :disco, :link, :forma_musical, :annio_creacion, :annio_estreno, :otro_soporte, :estado, :perfil_id, :estructura_poetica, :soporte, :soporte_nombre)
    end
end
