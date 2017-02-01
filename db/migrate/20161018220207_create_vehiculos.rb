class CreateVehiculos < ActiveRecord::Migration[5.0]
  def change
    create_table :vehiculos, id: false do |t|
      t.string :placa, primary_key: true
      t.string :marca
      t.string :modelo
      t.string :color
      t.string :tipo
      t.integer :anio
      t.integer :kilometraje
      t.integer :capacidadPasajeros
      t.decimal :capacidadCarga
      t.text :observaciones
      t.boolean :disponibilidad, :default => true, :null => false


      t.timestamps
    end


  end
end
