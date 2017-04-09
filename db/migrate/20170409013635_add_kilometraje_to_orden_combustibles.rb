class AddKilometrajeToOrdenCombustibles < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_combustibles, :kilometraje, :integer
  end
end
