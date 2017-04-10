class AddProveedorToOrdenMantenimientos < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_mantenimientos, :proveedor, :string
  end
end
