class AddDetalleToOrdenRepuestos < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_repuestos, :detalle, :text
  end
end
