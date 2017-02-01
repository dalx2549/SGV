class AddApprovedToPrestamo < ActiveRecord::Migration[5.0]
  def change
    add_column :prestamos, :approved, :boolean, :default => false, :null => false
  end
end
