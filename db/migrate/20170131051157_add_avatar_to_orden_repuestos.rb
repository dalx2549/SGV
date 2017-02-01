class AddAvatarToOrdenRepuestos < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_repuestos, :avatar, :string
  end
end
