class AddAddressLatitudeToPatient < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :address_latitude, :float
  end
end
