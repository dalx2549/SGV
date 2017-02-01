class AddCargoToPrestamos < ActiveRecord::Migration[5.0]
  def change
    add_column :prestamos, :cargo, :string
    add_column :prestamos, :departamento, :string
  end
end
