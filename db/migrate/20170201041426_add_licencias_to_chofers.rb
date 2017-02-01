class AddLicenciasToChofers < ActiveRecord::Migration[5.0]
  def change
    add_column :chofers, :licencias, :json
  end
end
