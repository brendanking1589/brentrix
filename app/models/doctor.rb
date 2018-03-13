class Doctor < ApplicationRecord
  # Direct associations

  has_many   :provider_codes,
             :class_name => "Provider"

  # Indirect associations

  # Validations

end
