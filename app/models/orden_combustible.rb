class OrdenCombustible < ApplicationRecord

  belongs_to :vehiculo, :foreign_key => "vehiculo_placa"
  belongs_to :factura

  validates_presence_of :estacionServicio, message: "Campo requerido"
  validates_presence_of :vehiculo_placa
  validates_presence_of :fechaEmision
  validates_presence_of :valorCompra
  validates_presence_of :persona
  validates_presence_of :cedula
  validates_presence_of :tipoCombustible
  validates_presence_of :cargo

  validate :orden_km_a

  def orden_km_a

    km = Vehiculo.find(self.vehiculo_placa).kilometraje

    if self.kilometraje >= km
      true
    else
      errors.add(:kilometraje, "Debe ser mayor o igual")
      false
    end

  end


end
