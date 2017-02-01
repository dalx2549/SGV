class Prestamo < ApplicationRecord

  belongs_to :user, :foreign_key=>"user_cedula"
  belongs_to :vehiculo, :foreign_key => "vehiculo_placa"

  validates_presence_of :fechaEntrega
  validates_presence_of :fechaDevolucion
  validates_presence_of :razon
  validates_presence_of :user_cedula
  validates_presence_of :vehiculo_placa


end
