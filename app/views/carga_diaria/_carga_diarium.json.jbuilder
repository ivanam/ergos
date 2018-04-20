json.extract! carga_diarium, :id, :fecha, :cantidad, :tipo_objetivo_id, :vendedor_id, :created_at, :updated_at
json.url carga_diarium_url(carga_diarium, format: :json)
