class Provider < ApplicationRecord
  # Direct associations

  belongs_to :doctor,
             :counter_cache => :provider_codes_count

  # Indirect associations

  # Validations

end
