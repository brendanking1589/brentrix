class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.integer :provider_id
      t.integer :treatment_id
      t.integer :patient_id
      t.integer :amount
      t.date :date

      t.timestamps

    end
  end
end
