class AddAddressFormattedAddressToPatient < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :address_formatted_address, :string
  end
end
