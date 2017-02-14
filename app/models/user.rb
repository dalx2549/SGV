class User < ApplicationRecord

  include ActiveModel::Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :prestamos
  accepts_nested_attributes_for :prestamos

  validates_presence_of :cedula
  validates :cedula, length: {maximum:10}
  validates :cedula, numericality: {only_integer: true}
  validates_format_of :email, :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/,
                      :multiline => true

  #Comprueba si el usuario esta aprobado para permitir el login
  def active_for_authentication?
    super && approved?
  end


  #Muestra mensaje de error si el usuario trata de logear sin ser aprobado antes
  def inactive_message
    if !approved?
      :not_approved
    else
      super # mensaje
    end
  end

end
