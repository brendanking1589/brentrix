class AddProviderCountToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :providers_count, :integer
  end
end
