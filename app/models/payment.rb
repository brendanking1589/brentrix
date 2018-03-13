class Payment < ApplicationRecord
  # Direct associations

  belongs_to :procedure,
             :counter_cache => true

  # Indirect associations

  has_one    :patient,
             :through => :procedure,
             :source => :patient

  has_one    :doctor,
             :through => :procedure,
             :source => :doctor

  # Validations

end
