class Procedure < ApplicationRecord
  # Direct associations

  belongs_to :provider,
             :counter_cache => true

  belongs_to :patient,
             :counter_cache => true

  # Indirect associations

  # Validations

end
