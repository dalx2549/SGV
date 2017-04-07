class Factura < ApplicationRecord

  has_one :orden_combustible, :foreign_key => "id_orden_combustible"
  has_one :orden_mantenimiento, :foreign_key => "id_orden_mantenimiento"
  has_one :orden_repuesto, :foreign_key => "id_orden_repuesto"

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :emisor
  validates_presence_of :numero
  validates_presence_of :avatar

  validate :orden_mantenimiento_exists
  validate :orden_combustible_exists
  validate :orden_repuesto_exists

#Valida existencia de la orden de combustible en la DB
  def orden_combustible_exists

    if self.id_orden_combustible.blank?
      true
    else
      begin
        OrdenCombustible.find(self.id_orden_combustible)
      rescue ActiveRecord::RecordNotFound
        errors.add(:id_orden_combustible, "No existe la orden especificada")
        false
      end
    end

  end

#Valida existencia de la orden de mantenimiento en la DB
  def orden_mantenimiento_exists

    if self.id_orden_mantenimiento.blank?
      true
    else
      begin
        OrdenMantenimiento.find(self.id_orden_mantenimiento)
      rescue ActiveRecord::RecordNotFound
        errors.add(:id_orden_mantenimiento, "No existe la orden especificada")
        false
      end
    end

  end

#Valida existencia de la orden de repuesto en la DB
  def orden_repuesto_exists

    if self.id_orden_respuesto.blank?
      true
    else
      begin
        OrdenRepuesto.find(self.id_orden_respuesto)
      rescue ActiveRecord::RecordNotFound
        errors.add(:id_orden_respuesto, "No existe la orden especificada")
        false
      end
    end

  end

end
