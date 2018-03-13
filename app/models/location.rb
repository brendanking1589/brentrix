class Location < ApplicationRecord
  # Direct associations

  has_many   :providers

  # Indirect associations

  # Validations

end
