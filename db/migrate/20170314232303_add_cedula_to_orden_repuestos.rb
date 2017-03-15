class AddCedulaToOrdenRepuestos < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_repuestos, :cedula, :integer
    add_column :orden_repuestos, :cargo, :string
  end
end
