class Prestamo < ApplicationRecord

  belongs_to :persona, :foreign_key=>"persona_cedula"


end
