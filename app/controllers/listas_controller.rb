class ListasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :set_lista, only: %i[ show edit update destroy desclasificar ]

  # GET /listas or /listas.json
  def index
    @activo = Perfil.find(session[:perfil_activo]['id'])
    @coleccion =  @activo.listas
  end

  # GET /listas/1 or /listas/1.json
  def show
    @coleccion = {}
    @coleccion['elementos'] = @objeto.elementos
  end

  # GET /listas/new
  def new
    case params[:class_name]
    when 'Perfil'
      padre = Perfil.find(params[:objeto_id])
    end
    @objeto = padre.listas.new
  end

  def nuevo
    @elemento = Elemento.find(params[:elemento_id])
    unless params[:nueva_lista][:lista].blank?
      @activo = Perfil.find(session[:perfil_activo]['id'])
      @activo.listas.create(lista: params[:nueva_lista][:lista])
    end

    redirect_to @elemento
  end

  # GET /listas/1/edit
  def edit
  end

  # POST /listas or /listas.json
  def create
    @objeto = Lista.new(lista_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Lista was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  def agrega_elemento
    @elemento = Elemento.find(params[:elemento_id])
    unless params[:lista_base][:lista_id].blank?
      @lista = Lista.find(params[:lista_base][:lista_id])
      @lista.elementos << @elemento
    end

    redirect_to @elemento    
  end

  # PATCH/PUT /listas/1 or /listas/1.json
  def update
    respond_to do |format|
      if @objeto.update(lista_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Lista was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  def desclasificar
    @elemento = Elemento.find(params[:objeto_id])
    @objeto.elementos.delete(@elemento)

    redirect_to @elemento
  end

  # DELETE /listas/1 or /listas/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Lista was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lista
      @objeto = Lista.find(params[:id])
    end

    def set_redireccion
      @redireccion = '/perfiles/activo'
    end

    # Only allow a list of trusted parameters through.
    def lista_params
      params.require(:lista).permit(:lista, :perfil_id)
    end
end
