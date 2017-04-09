class Vehiculo < ApplicationRecord

  include ActiveModel::Validations

  has_many :prestamos
  accepts_nested_attributes_for :prestamos
  has_many :orden_combustibles
  accepts_nested_attributes_for :orden_combustibles
  has_many :orden_mantenimientos
  accepts_nested_attributes_for :orden_mantenimientos

  mount_uploaders :avatars, AvatarUploader


  # Validaciones de campo requerido

  validates_presence_of :placa
  validates_presence_of :marca
  validates_presence_of :modelo
  validates_presence_of :color
  validates_presence_of :kilometraje
  validates_presence_of :capacidadPasajeros
  validates_presence_of :anio


  validates :kilometraje, numericality: { only_integer: true }

  validates :capacidadPasajeros, numericality: { only_integer: true, :less_than_or_equal_to => 50}

  validates :anio, numericality: { only_integer: true, :less_than_or_equal_to => 2050 }


  validates_format_of :placa, :with => /^[A-Z][A-Z][A-Z][-][0-9]{4}$/, :multiline => true

  validate :valid_km

  validate :valid_km_create, :on => :create

  def valid_km

    km = Vehiculo.find(self.placa).kilometraje

    if self.kilometraje > km
      true
    else
      errors.add(:kilometraje, "Debe ser mayor")
      false
    end

  end

  def valid_km_create


    if self.kilometraje > 0
      true
    else
      errors.add(:kilometraje, "Debe ser mayor")
      false
    end

  end

end
