class AddFechaToOrdenMantenimientos < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_mantenimientos, :fecha, :date
  end
end
