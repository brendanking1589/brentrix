class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :doctor_image

      t.timestamps

    end
  end
end
