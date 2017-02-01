class AddAvatarToFacturas < ActiveRecord::Migration[5.0]
  def change
    add_column :facturas, :avatar, :string
  end
end
