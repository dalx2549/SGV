class AddRechazadoToPrestamo < ActiveRecord::Migration[5.0]
  def change
    add_column :prestamos, :rechazado, :boolean
  end
end
