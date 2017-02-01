class AddAvatarToChofers < ActiveRecord::Migration[5.0]
  def change
    add_column :chofers, :avatar, :string
  end
end
