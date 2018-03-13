class AddProcedureCountToTreatments < ActiveRecord::Migration[5.0]
  def change
    add_column :treatments, :procedures_count, :integer
  end
end
