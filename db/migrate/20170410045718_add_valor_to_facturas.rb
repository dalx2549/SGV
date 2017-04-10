class AddValorToFacturas < ActiveRecord::Migration[5.0]
  def change
    add_column :facturas, :valor, :decimal
  end
end
