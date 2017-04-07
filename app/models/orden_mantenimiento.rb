class OrdenMantenimiento < ApplicationRecord

  belongs_to :vehiculo, :foreign_key => "vehiculo_placa"
  belongs_to :factura

  validates_presence_of :vehiculo_placa
  validates_presence_of :tipo
  validates_presence_of :kilometraje
  validates_presence_of :encargado
  validates_presence_of :cedula
  validates_presence_of :cargo

  validate :orden_km

  def orden_km

    km = Vehiculo.find(self.vehiculo_placa).kilometraje

    if self.kilometraje >= km
      true
    else
      errors.add(:kilometraje, "Debe ser mayor o igual")
      false
    end

  end

end
