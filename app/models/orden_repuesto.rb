class OrdenRepuesto < ApplicationRecord

  belongs_to :vehiculo, :foreign_key => "vehiculo_placa"
  belongs_to :factura

  validates_presence_of :fecha
  validates_presence_of :encargado
  validates_presence_of :proveedor
  validates_presence_of :vehiculo_placa

  mount_uploader :avatar

end
