class CreateOrdenCombustibles < ActiveRecord::Migration[5.0]
  def change
    create_table :orden_combustibles do |t|

      t.string :estacionServicio
      t.string :vehiculo_placa
      t.date :fechaEmision
      t.string :tipoCombustible
      t.decimal :valorCompra
      t.string :persona
      t.integer :cedula
      t.string :cargo

      t.timestamps
    end



  end


  execute "SELECT setval('orden_combustibles_id_seq', 1000)"



end
