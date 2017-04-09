class OrdenRepuesto < ApplicationRecord

  belongs_to :vehiculo, :foreign_key => "vehiculo_placa"
  belongs_to :factura

  validates_presence_of :fecha
  validates_presence_of :encargado
  validates_presence_of :proveedor
  validates_presence_of :vehiculo_placa, :message => "es requerido"

  mount_uploader :avatar

  validate :orden_km_b

  def orden_km_b

    km = Vehiculo.find(self.vehiculo_placa).kilometraje

    if self.kilometraje >= km
      true
    else
      errors.add(:kilometraje, "Debe ser mayor o igual")
      false
    end

  end

end
