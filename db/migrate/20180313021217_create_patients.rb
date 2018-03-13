class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :phone_number
      t.string :patient_image

      t.timestamps

    end
  end
end
