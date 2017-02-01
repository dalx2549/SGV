json.extract! vehiculo, :id, :marca, :modelo, :color, :kilometraje, :capacidadPasajeros, :observaciones, :created_at, :updated_at
json.url vehiculo_url(vehiculo, format: :json)