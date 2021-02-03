json.extract! perfil, :id, :email, :usuario_id, :administrador_id, :created_at, :updated_at
json.url perfil_url(perfil, format: :json)
