class Vehiculo < ApplicationRecord

  has_attached_file :image, styles: { medium: '400x400>', thumb: '48x48>' }

  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  do_not_validate_attachment_file_type :image

  validates :kilometraje, numericality: { only_integer: true }

  validates :capacidadPasajeros, numericality: { only_integer: true, :less_than_or_equal_to => 50}

end
