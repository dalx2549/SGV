class AddCedulaChoferToPrestamos < ActiveRecord::Migration[5.0]
  def change
    add_column :prestamos, :chofer_cedula, :integer
  end
end
