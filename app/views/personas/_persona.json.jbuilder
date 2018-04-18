json.extract! persona, :id, :numero_documento, :cuit, :apellido, :nombre, :domicilio, :telefono, :email, :fecha_nacimineto, :tipo_documento_id, :created_at, :updated_at
json.url persona_url(persona, format: :json)
