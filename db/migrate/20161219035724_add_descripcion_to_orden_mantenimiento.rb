class AddDescripcionToOrdenMantenimiento < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_mantenimientos, :encargado, :string
    add_column :orden_mantenimientos, :cedula, :integer
    add_column :orden_mantenimientos, :cargo, :string
  end
end
