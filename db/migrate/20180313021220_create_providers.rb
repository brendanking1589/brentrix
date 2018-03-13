class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer :doctor_id
      t.string :provider_code_string
      t.integer :location_id

      t.timestamps

    end
  end
end
