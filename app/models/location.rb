class Location < ApplicationRecord
  # Direct associations

  has_many   :providers

  # Indirect associations

  has_many   :patients,
             :through => :procedures,
             :source => :patient

  has_many   :procedures,
             :through => :providers,
             :source => :procedures

  # Validations

end
