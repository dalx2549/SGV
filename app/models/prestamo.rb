class Prestamo < ApplicationRecord

  include ActiveModel::Validations

  #Objeto pertenece a Usuario
  belongs_to :user, :foreign_key=>"user_cedula"
  #Objeto pertenece a Vehiculo
  belongs_to :vehiculo, :foreign_key => "vehiculo_placa"



  #Valida la presencia de los atributos requeridos
  validates_presence_of :fechaEntrega
  validates_presence_of :fechaDevolucion
  validates_presence_of :razon
  validates_presence_of :user_cedula
  validates_presence_of :vehiculo_placa, :message => "Debe seleccionar un vehículo"

  validates_uniqueness_of :fechaEntrega, scope: [:vehiculo_placa, :approved]

  validates :fechaEntrega, date: { after_or_equal_to: Proc.new{Date.today}, message: 'Debe ser posterior a la fecha actual' },
            :on => :create

  validates :fechaDevolucion, date: { after_or_equal_to: :fechaEntrega, message: 'Debe ser posterior a la fecha de entrega'}


end
