class OrdenMantenimiento < ApplicationRecord

  belongs_to :vehiculo, :foreign_key => "vehiculo_placa"
  belongs_to :factura

  validates_presence_of :vehiculo_placa
  validates_presence_of :tipo
  validates_presence_of :kilometraje
  validates_presence_of :encargado
  validates_presence_of :cedula
  validates_presence_of :cargo

end
