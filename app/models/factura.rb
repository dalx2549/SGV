class Factura < ApplicationRecord

  has_one :orden_combustible, :foreign_key => "id_orden_combustible"
  has_one :orden_mantenimiento, :foreign_key => "id_orden_mantenimiento"
  has_one :orden_repuesto, :foreign_key => "id_orden_repuesto"

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :emisor
  validates_presence_of :numero
  validates_presence_of :avatar

end
