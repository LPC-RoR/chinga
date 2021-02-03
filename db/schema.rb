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

ActiveRecord::Schema.define(version: 2021_02_02_234258) do

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

  create_table "clasificaciones", force: :cascade do |t|
    t.integer "elemento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lista_id"
    t.index ["elemento_id"], name: "index_clasificaciones_on_elemento_id"
    t.index ["lista_id"], name: "index_clasificaciones_on_lista_id"
  end

  create_table "elementos", force: :cascade do |t|
    t.string "titulo"
    t.text "letra"
    t.string "autor"
    t.string "genero"
    t.string "pais"
    t.string "ciudad_autor"
    t.string "interprete"
    t.string "disco"
    t.string "link"
    t.string "forma_musical"
    t.integer "annio_creacion"
    t.integer "annio_estreno"
    t.string "otro_soporte"
    t.integer "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "estado"
    t.index ["annio_creacion"], name: "index_elementos_on_annio_creacion"
    t.index ["annio_estreno"], name: "index_elementos_on_annio_estreno"
    t.index ["ciudad_autor"], name: "index_elementos_on_ciudad_autor"
    t.index ["disco"], name: "index_elementos_on_disco"
    t.index ["estado"], name: "index_elementos_on_estado"
    t.index ["forma_musical"], name: "index_elementos_on_forma_musical"
    t.index ["genero"], name: "index_elementos_on_genero"
    t.index ["interprete"], name: "index_elementos_on_interprete"
    t.index ["pais"], name: "index_elementos_on_pais"
    t.index ["perfil_id"], name: "index_elementos_on_perfil_id"
    t.index ["titulo"], name: "index_elementos_on_titulo"
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

  create_table "herencias", force: :cascade do |t|
    t.integer "equipo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lista_id"
    t.index ["equipo_id"], name: "index_herencias_on_equipo_id"
    t.index ["lista_id"], name: "index_herencias_on_lista_id"
  end

  create_table "integrantes", force: :cascade do |t|
    t.integer "equipo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "perfil_id"
    t.index ["equipo_id"], name: "index_integrantes_on_equipo_id"
    t.index ["perfil_id"], name: "index_integrantes_on_perfil_id"
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

  create_table "perfiles", force: :cascade do |t|
    t.string "email"
    t.integer "usuario_id"
    t.integer "administrador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrador_id"], name: "index_perfiles_on_administrador_id"
    t.index ["email"], name: "index_perfiles_on_email"
    t.index ["usuario_id"], name: "index_perfiles_on_usuario_id"
  end

  create_table "textos", force: :cascade do |t|
    t.string "texto"
    t.string "sha1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sha1"], name: "index_textos_on_sha1"
    t.index ["texto"], name: "index_textos_on_texto"
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
