json.extract! factura, :id, :emisor, :numero, :id_orden_combustible, :id_orden_respuesto, :id_orden_mantenimiento, :created_at, :updated_at
json.url factura_url(factura, format: :json)