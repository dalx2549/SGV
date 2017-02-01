json.extract! prestamo, :id, :fechaEntrega, :fechaDevolucion, :razon, :observaciones, :persona_id, :vehiculo_id, :created_at, :updated_at
json.url prestamo_url(prestamo, format: :json)