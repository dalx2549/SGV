class AddChasisToVehiculos < ActiveRecord::Migration[5.0]
  def change
    add_column :vehiculos, :nro_chasis, :string
    add_column :vehiculos, :cilindraje, :integer
  end
end
