class Persona < ApplicationRecord

  has_many :prestamos
  accepts_nested_attributes_for :prestamos

  validates :cedula, numericality: {only_integer: true}, length: {maximum:10}
  validates :email, :email_format => {:message => 'El e-mail no es válido'}

end
