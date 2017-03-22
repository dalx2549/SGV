class AddMantenimientoToVehiculos < ActiveRecord::Migration[5.0]
  def change
    add_column :vehiculos, :mantenimiento, :boolean
  end
end
