class Payment < ApplicationRecord
  # Direct associations

  belongs_to :procedure,
             :counter_cache => true

  # Indirect associations

  # Validations

end
