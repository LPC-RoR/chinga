json.extract! observacion, :id, :observacion, :detalle, :elemento_id, :owner_id, :created_at, :updated_at
json.url observacion_url(observacion, format: :json)
