class AddDetalleToOrdenMantenimientos < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_mantenimientos, :detalle, :text
  end
end
