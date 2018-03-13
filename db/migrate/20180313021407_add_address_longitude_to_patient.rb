class AddAddressLongitudeToPatient < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :address_longitude, :float
  end
end
