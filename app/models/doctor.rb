class Doctor < ApplicationRecord
  mount_uploader :doctor_image, DoctorImageUploader

  # Direct associations

  has_many   :provider_codes,
             :class_name => "Provider"

  # Indirect associations

  has_many   :collections,
             :through => :procedures,
             :source => :payments

  has_many   :procedures,
             :through => :provider_codes,
             :source => :procedures

  # Validations

end
