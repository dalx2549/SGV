class AddChoferToPrestamos < ActiveRecord::Migration[5.0]
  def change
    add_column :prestamos, :chofer, :boolean
  end
end
