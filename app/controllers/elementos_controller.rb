class ElementosController < ApplicationController
  before_action :authenticate_usuario!, except: :show
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_elemento, only: %i[ show edit update destroy estado asignar desasignar eliminar papelera publicar ]

  before_action :corrige_elemento, only: :edit

  after_action :publica_elemento, only: [:create, :update]
  after_action :limpia_soportes, only: [:create, :update]
  after_action :corrige_elemento, only: :destroy

  include ProcesaEstructura
  include ProcesaElemento

  # GET /elementos or /elementos.json
  def index
    @coleccion = Elemento.all
  end

  # GET /elementos/1 or /elementos/1.json
  def show
    if usuario_signed_in?
      @activo = Perfil.find(session[:perfil_activo]['id'])
      @mis_listas = @activo.listas.order(:lista)
    end

    tipos_soporte_ids = TipoSoporte.where(tipo_soporte: ['Disco', 'Libro']).ids
    @soportes_base = @objeto.soportes.where(tipo_soporte_id: tipos_soporte_ids)

    @coleccion = {}
    @coleccion['soportes'] = @objeto.soportes
    @coleccion['comentarios'] = @objeto.comentarios

    @claves = @objeto.claves.order(:orden)
  end

  # GET /elementos/new
  def new
    @activo = Perfil.find(session[:perfil_activo]['id'])
    @objeto = @activo.contribuciones.new(estado: 'publicada')
    4.times { @objeto.soportes.build }
  end

  # GET /elementos/1/edit
  def edit
    2.times { @objeto.soportes.build }
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

  def asignar
    lista = Lista.find(params[:lista_id])
    @objeto.listas << lista

    redirect_to @objeto
  end

  def desasignar
    lista = Lista.find(params[:lista_id])
    @objeto.listas.delete(lista)

    redirect_to @objeto
  end

  def publicar
    @objeto.estado = 'publicada'
    @objeto.save
    procesa_elemento(@objeto)

    redirect_to contribuciones_path
  end

  def papelera
    desprocesa_elemento(@objeto)
    @objeto.estado = 'papelera'
    @objeto.save

    redirect_to contribuciones_path
  end

  def eliminar
    desprocesa_elemento(@objeto)
    @objeto.soportes.each do |sop|
      sop.delete
    end
    @objeto.listas.each do |lis|
      lis.delete
    end
    @objeto.delete

    redirect_to contribuciones_path
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
    def publica_elemento
      procesa_elemento(@objeto)
      indexa_registro(@objeto)
    end

    def corrige_elemento
      desprocesa_elemento(@objeto)
      desindexa_registro(@objeto)
    end

    def limpia_soportes
      en_blanco = @objeto.soportes.where(tipo_soporte_id: nil)
      en_blanco.delete_all
    end

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
      params.require(:elemento).permit(:titulo, :letra, :autor, :genero_autor, :pais, :ciudad_autor, :interprete, :forma_musical, :annio_creacion, :annio_estreno, :otro_soporte, :estado, :perfil_id, :estructura_poetica, :soporte, :soporte_nombre, :ilustracion, :ilustracion_cache, :remove_ilustracion, :tradicional, soportes_attributes: [:id, :tipo_soporte_id, :soporte, :link, :_destroy])
    end
end
