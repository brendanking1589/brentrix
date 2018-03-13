class AddProcedureCountToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :procedures_count, :integer
  end
end
