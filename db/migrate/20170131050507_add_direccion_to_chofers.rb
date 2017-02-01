class AddDireccionToChofers < ActiveRecord::Migration[5.0]
  def change
    add_column :chofers, :direccion, :string
    add_column :chofers, :email, :string
    add_column :chofers, :telefono, :integer
  end
end
