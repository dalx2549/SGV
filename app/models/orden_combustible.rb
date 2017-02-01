class OrdenCombustible < ApplicationRecord

  belongs_to :vehiculo, :foreign_key => "vehiculo_placa"
  belongs_to :factura

  validates_presence_of :estacionServicio
  validates_presence_of :vehiculo_placa
  validates_presence_of :fechaEmision
  validates_presence_of :valorCompra
  validates_presence_of :persona
  validates_presence_of :cedula
  validates_presence_of :tipoCombustible
  validates_presence_of :cargo


end
