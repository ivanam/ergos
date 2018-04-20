json.extract! persona, :id, :tipo_documento_id, :numero_documento, :cuit, :apellido, :nombre, :domicilio, :telefono, :email, :fecha_nacimiento, :created_at, :updated_at
json.url persona_url(persona, format: :json)
