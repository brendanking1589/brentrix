class Patient < ApplicationRecord
  mount_uploader :patient_image, PatientImageUploader

  # Direct associations

  has_many   :procedures

  # Indirect associations

  has_many   :locations,
             :through => :procedures,
             :source => :location

  has_many   :payments,
             :through => :procedures,
             :source => :payments

  # Validations

end
