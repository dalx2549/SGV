class AddTraccionToVehiculo < ActiveRecord::Migration[5.0]
  def change
    add_column :vehiculos, :traccion, :string, :null => false, :default => ""
  end
end
