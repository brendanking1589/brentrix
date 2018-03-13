class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.string :description
      t.string :treatment_code

      t.timestamps

    end
  end
end
