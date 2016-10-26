class CreatePrestamos < ActiveRecord::Migration[5.0]
  def change
    create_table :prestamos do |t|
      t.date :fechaEntrega
      t.date :fechaDevolucion
      t.text :razon
      t.text :observaciones
      t.integer :persona_cedula
      t.integer :vehiculo_placa

      t.timestamps
    end
  end
end
