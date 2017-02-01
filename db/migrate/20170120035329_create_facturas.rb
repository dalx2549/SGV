class CreateFacturas < ActiveRecord::Migration[5.0]
  def change
    create_table :facturas, id: :uuid do |t|
      t.string :emisor
      t.integer :numero
      t.integer :id_orden_combustible
      t.integer :id_orden_respuesto
      t.integer :id_orden_mantenimiento

      t.timestamps
    end
  end
end
