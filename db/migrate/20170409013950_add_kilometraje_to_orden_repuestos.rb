class AddKilometrajeToOrdenRepuestos < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_repuestos, :kilometraje, :integer
  end
end
