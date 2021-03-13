class ParametrosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_parametro, only: %i[ show edit update destroy ]

  # GET /parametros or /parametros.json
  def index
    @coleccion = {}

    @coleccion['genero_autores']      = GeneroAutor.all.order(:genero_autor)
    @coleccion['forma_musicales']     = FormaMusical.all.order(:forma_musical)
    @coleccion['estructura_poeticas'] = EstructuraPoetica.all.order(:estructura_poetica)
    @coleccion['soportes']            = Soporte.all.order(:soporte)
  end

  private
end
