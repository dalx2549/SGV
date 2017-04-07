class Chofer < ApplicationRecord

  has_many :prestamos, :dependent => :delete_all
  accepts_nested_attributes_for :prestamos
  mount_uploader :avatar, AvatarUploader
  mount_uploaders :licencias, LicenciaUploader

  #Validaciones de campo requerido

  validates_presence_of :cedula
  validates_presence_of :nombres
  validates_presence_of :apellidos
  validates_presence_of :fechaNacimiento
  validates_presence_of :tipoLicencia
  validates_presence_of :experiencia
  validates_presence_of :avatar

end
