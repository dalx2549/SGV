class CreateOrdenRepuestos < ActiveRecord::Migration[5.0]
  def change
    create_table :orden_repuestos do |t|
      t.date :fecha
      t.string :encargado
      t.string :proveedor
      t.text :observaciones
      t.string :vehiculo_placa

      t.timestamps
    end
  end
end
