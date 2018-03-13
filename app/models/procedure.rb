class Procedure < ApplicationRecord
  # Direct associations

  has_many   :payments

  belongs_to :treatment,
             :counter_cache => true

  belongs_to :provider,
             :counter_cache => true

  belongs_to :patient,
             :counter_cache => true

  # Indirect associations

  # Validations

end
