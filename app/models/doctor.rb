class Doctor < ApplicationRecord
  # Direct associations

  has_many   :provider_codes,
             :class_name => "Provider"

  # Indirect associations

  has_many   :procedures,
             :through => :provider_codes,
             :source => :procedures

  # Validations

end
