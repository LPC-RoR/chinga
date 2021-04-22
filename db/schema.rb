# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_22_012352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administradores", force: :cascade do |t|
    t.string "email"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "administrador"
    t.index ["email"], name: "index_administradores_on_email"
    t.index ["usuario_id"], name: "index_administradores_on_usuario_id"
  end

  create_table "autores", force: :cascade do |t|
    t.string "autor"
    t.integer "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perfil_id"], name: "index_autores_on_perfil_id"
  end

  create_table "clasificaciones", force: :cascade do |t|
    t.integer "elemento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lista_id"
    t.index ["elemento_id"], name: "index_clasificaciones_on_elemento_id"
    t.index ["lista_id"], name: "index_clasificaciones_on_lista_id"
  end

  create_table "claves", force: :cascade do |t|
    t.string "clave"
    t.string "sha1"
    t.integer "orden"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden"], name: "index_claves_on_orden"
    t.index ["sha1"], name: "index_claves_on_sha1"
  end

  create_table "comentarios", force: :cascade do |t|
    t.string "comentario"
    t.text "detalle"
    t.integer "elemento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.index ["elemento_id"], name: "index_comentarios_on_elemento_id"
    t.index ["owner_id"], name: "index_comentarios_on_owner_id"
  end

  create_table "creaciones", force: :cascade do |t|
    t.integer "autor_id"
    t.integer "elemento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autor_id"], name: "index_creaciones_on_autor_id"
    t.index ["elemento_id"], name: "index_creaciones_on_elemento_id"
  end

  create_table "elementos", force: :cascade do |t|
    t.string "titulo"
    t.text "letra"
    t.string "autor"
    t.string "genero_autor"
    t.string "pais"
    t.string "ciudad_autor"
    t.string "interprete"
    t.string "forma_musical"
    t.integer "annio_creacion"
    t.integer "annio_estreno"
    t.string "otro_soporte"
    t.integer "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "estado"
    t.string "soporte"
    t.string "soporte_nombre"
    t.string "ilustracion"
    t.string "ilustracion_cache"
    t.string "estructura_poetica"
    t.boolean "tradicional"
    t.index ["annio_creacion"], name: "index_elementos_on_annio_creacion"
    t.index ["annio_estreno"], name: "index_elementos_on_annio_estreno"
    t.index ["ciudad_autor"], name: "index_elementos_on_ciudad_autor"
    t.index ["estado"], name: "index_elementos_on_estado"
    t.index ["estructura_poetica"], name: "index_elementos_on_estructura_poetica"
    t.index ["forma_musical"], name: "index_elementos_on_forma_musical"
    t.index ["genero_autor"], name: "index_elementos_on_genero_autor"
    t.index ["interprete"], name: "index_elementos_on_interprete"
    t.index ["pais"], name: "index_elementos_on_pais"
    t.index ["perfil_id"], name: "index_elementos_on_perfil_id"
    t.index ["soporte"], name: "index_elementos_on_soporte"
    t.index ["titulo"], name: "index_elementos_on_titulo"
    t.index ["tradicional"], name: "index_elementos_on_tradicional"
  end

  create_table "equipos", force: :cascade do |t|
    t.string "equipo"
    t.string "sha1"
    t.integer "administrador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrador_id"], name: "index_equipos_on_administrador_id"
    t.index ["equipo"], name: "index_equipos_on_equipo"
    t.index ["sha1"], name: "index_equipos_on_sha1"
  end

  create_table "estructura_poeticas", force: :cascade do |t|
    t.string "estructura_poetica"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_estructura_poeticas_on_owner_id"
  end

  create_table "evaluaciones", force: :cascade do |t|
    t.string "aspecto"
    t.string "evaluacion"
    t.integer "elemento_id"
    t.integer "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["elemento_id"], name: "index_evaluaciones_on_elemento_id"
    t.index ["perfil_id"], name: "index_evaluaciones_on_perfil_id"
  end

  create_table "forma_musicales", force: :cascade do |t|
    t.string "forma_musical"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_forma_musicales_on_owner_id"
  end

  create_table "formas", force: :cascade do |t|
    t.string "forma"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_formas_on_owner_id"
  end

  create_table "genero_autores", force: :cascade do |t|
    t.string "genero_autor"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_genero_autores_on_owner_id"
  end

  create_table "herencias", force: :cascade do |t|
    t.integer "equipo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lista_id"
    t.index ["equipo_id"], name: "index_herencias_on_equipo_id"
    t.index ["lista_id"], name: "index_herencias_on_lista_id"
  end

  create_table "inclusiones", force: :cascade do |t|
    t.integer "soporte_id"
    t.integer "perfil_id"
    t.integer "elemento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["elemento_id"], name: "index_inclusiones_on_elemento_id"
    t.index ["perfil_id"], name: "index_inclusiones_on_perfil_id"
    t.index ["soporte_id"], name: "index_inclusiones_on_soporte_id"
  end

  create_table "ind_bases", force: :cascade do |t|
    t.integer "clave_id"
    t.integer "ind_palabra_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clave_id"], name: "index_ind_bases_on_clave_id"
    t.index ["ind_palabra_id"], name: "index_ind_bases_on_ind_palabra_id"
  end

  create_table "ind_claves", force: :cascade do |t|
    t.integer "ind_clave"
    t.integer "ind_estructura_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ind_clave"], name: "index_ind_claves_on_ind_clave"
    t.index ["ind_estructura_id"], name: "index_ind_claves_on_ind_estructura_id"
  end

  create_table "ind_direcciones", force: :cascade do |t|
    t.integer "origen_id"
    t.integer "destino_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destino_id"], name: "index_ind_direcciones_on_destino_id"
    t.index ["origen_id"], name: "index_ind_direcciones_on_origen_id"
  end

  create_table "ind_estructuras", force: :cascade do |t|
    t.string "ind_estructura"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ind_estructura"], name: "index_ind_estructuras_on_ind_estructura"
  end

  create_table "ind_expresiones", force: :cascade do |t|
    t.string "ind_expresion"
    t.integer "ind_estructura_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ind_estructura_id"], name: "index_ind_expresiones_on_ind_estructura_id"
    t.index ["ind_expresion"], name: "index_ind_expresiones_on_ind_expresion"
  end

  create_table "ind_facetas", force: :cascade do |t|
    t.integer "ind_estructura_id"
    t.string "ind_faceta"
    t.string "faceta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faceta"], name: "index_ind_facetas_on_faceta"
    t.index ["ind_estructura_id"], name: "index_ind_facetas_on_ind_estructura_id"
    t.index ["ind_faceta"], name: "index_ind_facetas_on_ind_faceta"
  end

  create_table "ind_indices", force: :cascade do |t|
    t.integer "ind_estructura_id"
    t.integer "ind_clave_id"
    t.integer "ind_faceta_id"
    t.string "class_name"
    t.integer "objeto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_name"], name: "index_ind_indices_on_class_name"
    t.index ["ind_clave_id"], name: "index_ind_indices_on_ind_clave_id"
    t.index ["ind_estructura_id"], name: "index_ind_indices_on_ind_estructura_id"
    t.index ["ind_faceta_id"], name: "index_ind_indices_on_ind_faceta_id"
    t.index ["objeto_id"], name: "index_ind_indices_on_objeto_id"
  end

  create_table "ind_lenguajes", force: :cascade do |t|
    t.string "ind_lenguaje"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ind_lenguaje"], name: "index_ind_lenguajes_on_ind_lenguaje"
  end

  create_table "ind_modelos", force: :cascade do |t|
    t.integer "ind_estructura_id"
    t.string "ind_modelo"
    t.string "campos"
    t.string "facetas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ind_estructura_id"], name: "index_ind_modelos_on_ind_estructura_id"
    t.index ["ind_modelo"], name: "index_ind_modelos_on_ind_modelo"
  end

  create_table "ind_palabras", force: :cascade do |t|
    t.integer "ind_estructura_id"
    t.integer "ind_lenguaje_id"
    t.integer "ind_clave_id"
    t.string "ind_palabra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ind_clave_id"], name: "index_ind_palabras_on_ind_clave_id"
    t.index ["ind_estructura_id"], name: "index_ind_palabras_on_ind_estructura_id"
    t.index ["ind_lenguaje_id"], name: "index_ind_palabras_on_ind_lenguaje_id"
    t.index ["ind_palabra"], name: "index_ind_palabras_on_ind_palabra"
  end

  create_table "ind_redacciones", force: :cascade do |t|
    t.integer "ind_palabra_id"
    t.integer "ind_expresion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ind_expresion_id"], name: "index_ind_redacciones_on_ind_expresion_id"
    t.index ["ind_palabra_id"], name: "index_ind_redacciones_on_ind_palabra_id"
  end

  create_table "integrantes", force: :cascade do |t|
    t.integer "equipo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "perfil_id"
    t.index ["equipo_id"], name: "index_integrantes_on_equipo_id"
    t.index ["perfil_id"], name: "index_integrantes_on_perfil_id"
  end

  create_table "interpretes", force: :cascade do |t|
    t.string "interprete"
    t.integer "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perfil_id"], name: "index_interpretes_on_perfil_id"
  end

  create_table "lineas", force: :cascade do |t|
    t.string "linea"
    t.string "ultima"
    t.integer "n_parrafo"
    t.integer "n_linea"
    t.integer "texto_id"
    t.integer "ultima_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "elemento_id"
    t.index ["elemento_id"], name: "index_lineas_on_elemento_id"
    t.index ["n_linea"], name: "index_lineas_on_n_linea"
    t.index ["n_parrafo"], name: "index_lineas_on_n_parrafo"
    t.index ["texto_id"], name: "index_lineas_on_texto_id"
    t.index ["ultima_id"], name: "index_lineas_on_ultima_id"
  end

  create_table "listas", force: :cascade do |t|
    t.string "lista"
    t.integer "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lista"], name: "index_listas_on_lista"
    t.index ["perfil_id"], name: "index_listas_on_perfil_id"
  end

  create_table "mejoras", force: :cascade do |t|
    t.string "mejora"
    t.text "detalle"
    t.integer "elemento_id"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["elemento_id"], name: "index_mejoras_on_elemento_id"
    t.index ["owner_id"], name: "index_mejoras_on_owner_id"
  end

  create_table "mensajes", force: :cascade do |t|
    t.string "mensaje"
    t.string "tipo"
    t.string "estado"
    t.string "email"
    t.datetime "fecha_envio"
    t.text "detalle"
    t.integer "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_mensajes_on_email"
    t.index ["estado"], name: "index_mensajes_on_estado"
    t.index ["fecha_envio"], name: "index_mensajes_on_fecha_envio"
    t.index ["perfil_id"], name: "index_mensajes_on_perfil_id"
    t.index ["tipo"], name: "index_mensajes_on_tipo"
  end

  create_table "observaciones", force: :cascade do |t|
    t.string "observacion"
    t.text "detalle"
    t.integer "elemento_id"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["elemento_id"], name: "index_observaciones_on_elemento_id"
    t.index ["owner_id"], name: "index_observaciones_on_owner_id"
  end

  create_table "participantes", force: :cascade do |t|
    t.integer "perfil_id"
    t.integer "rueda_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perfil_id"], name: "index_participantes_on_perfil_id"
    t.index ["rueda_id"], name: "index_participantes_on_rueda_id"
  end

  create_table "pasos", force: :cascade do |t|
    t.integer "orden"
    t.string "paso"
    t.text "detalle"
    t.integer "tutorial_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden"], name: "index_pasos_on_orden"
    t.index ["tutorial_id"], name: "index_pasos_on_tutorial_id"
  end

  create_table "perfiles", force: :cascade do |t|
    t.string "email"
    t.integer "usuario_id"
    t.integer "administrador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.string "usuario"
    t.text "presentacion"
    t.string "facebook"
    t.string "instagram"
    t.string "imagen"
    t.index ["administrador_id"], name: "index_perfiles_on_administrador_id"
    t.index ["email"], name: "index_perfiles_on_email"
    t.index ["usuario"], name: "index_perfiles_on_usuario"
    t.index ["usuario_id"], name: "index_perfiles_on_usuario_id"
  end

  create_table "registros", force: :cascade do |t|
    t.integer "interprete_id"
    t.integer "elemento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["elemento_id"], name: "index_registros_on_elemento_id"
    t.index ["interprete_id"], name: "index_registros_on_interprete_id"
  end

  create_table "ruedas", force: :cascade do |t|
    t.integer "administrador_id"
    t.string "rueda"
    t.string "ubicacion"
    t.text "invitacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrador_id"], name: "index_ruedas_on_administrador_id"
  end

  create_table "rutas", force: :cascade do |t|
    t.integer "clave_id"
    t.integer "elemento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clave_id"], name: "index_rutas_on_clave_id"
    t.index ["elemento_id"], name: "index_rutas_on_elemento_id"
  end

  create_table "soportes", force: :cascade do |t|
    t.string "soporte"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.string "link"
    t.integer "tipo_soporte_id"
    t.string "imagen"
    t.integer "annio"
    t.string "sha1"
    t.integer "perfil_id"
    t.integer "elemento_id"
    t.index ["annio"], name: "index_soportes_on_annio"
    t.index ["elemento_id"], name: "index_soportes_on_elemento_id"
    t.index ["owner_id"], name: "index_soportes_on_owner_id"
    t.index ["perfil_id"], name: "index_soportes_on_perfil_id"
    t.index ["soporte"], name: "index_soportes_on_soporte"
    t.index ["tipo_soporte_id"], name: "index_soportes_on_tipo_soporte_id"
  end

  create_table "tema_ayudas", force: :cascade do |t|
    t.integer "orden"
    t.string "tema_ayuda"
    t.text "detalle"
    t.string "tipo"
    t.string "ilustracion"
    t.string "ilustracion_cache"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "activo"
    t.index ["activo"], name: "index_tema_ayudas_on_activo"
    t.index ["orden"], name: "index_tema_ayudas_on_orden"
    t.index ["tipo"], name: "index_tema_ayudas_on_tipo"
  end

  create_table "textos", force: :cascade do |t|
    t.string "texto"
    t.string "sha1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sha1"], name: "index_textos_on_sha1"
    t.index ["texto"], name: "index_textos_on_texto"
  end

  create_table "tipo_soportes", force: :cascade do |t|
    t.string "tipo_soporte"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.index ["owner_id"], name: "index_tipo_soportes_on_owner_id"
  end

  create_table "tutoriales", force: :cascade do |t|
    t.integer "orden"
    t.string "tutorial"
    t.text "detalle"
    t.integer "tema_ayuda_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden"], name: "index_tutoriales_on_orden"
    t.index ["tema_ayuda_id"], name: "index_tutoriales_on_tema_ayuda_id"
  end

  create_table "ultimas", force: :cascade do |t|
    t.string "ultima"
    t.string "sha1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sha1"], name: "index_ultimas_on_sha1"
    t.index ["ultima"], name: "index_ultimas_on_ultima"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

end
