class AddAvatarToVehiculos < ActiveRecord::Migration[5.0]
  def change
    add_column :vehiculos, :avatars, :json
  end
end
