class Provider < ApplicationRecord
  # Direct associations

  has_many   :procedures

  belongs_to :doctor,
             :counter_cache => :provider_codes_count

  # Indirect associations

  # Validations

end
