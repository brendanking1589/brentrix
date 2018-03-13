require 'open-uri'
class Patient < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
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
