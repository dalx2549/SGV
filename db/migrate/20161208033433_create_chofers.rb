class CreateChofers < ActiveRecord::Migration[5.0]
  def change
    create_table :chofers, id: false do |t|

      t.integer :cedula, primary_key: true
      t.string :nombres, null: false
      t.string :apellidos, null: false
      t.date :fechaNacimiento, null: false
      t.string :tipoLicencia, null: false
      t.text :experiencia, default: ""

      t.timestamps
    end
  end
end
