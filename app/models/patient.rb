class Patient < ApplicationRecord
  # Direct associations

  has_many   :procedures

  # Indirect associations

  has_many   :payments,
             :through => :procedures,
             :source => :payments

  # Validations

end
