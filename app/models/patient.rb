class Patient < ApplicationRecord
  # Direct associations

  has_many   :procedures

  # Indirect associations

  # Validations

end
