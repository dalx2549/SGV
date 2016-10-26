class CreatePersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :personas, id: false do |t|
      t.integer :cedula, primary_key: true
      t.string :nombres
      t.string :apellidos
      t.string :email
      t.string :departamento
      t.string :cargo

      t.timestamps
    end
  end
end
