class CreateOrdenMantenimientos < ActiveRecord::Migration[5.0]
  def change
    create_table :orden_mantenimientos do |t|
      t.string :vehiculo_placa
      t.string :tipo
      t.integer :kilometraje

      t.timestamps
    end
  end
end
