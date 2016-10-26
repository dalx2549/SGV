json.extract! persona, :id, :cedula, :nombres, :apellidos, :email, :departamento, :cargo, :created_at, :updated_at
json.url persona_url(persona, format: :json)