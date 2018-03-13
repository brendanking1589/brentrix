class AddProviderCodeCountToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :provider_codes_count, :integer
  end
end
