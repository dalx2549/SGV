json.extract! orden_mantenimiento, :id, :vehiculo_placa, :tipo, :kilometraje, :created_at, :updated_at
json.url orden_mantenimiento_url(orden_mantenimiento, format: :json)