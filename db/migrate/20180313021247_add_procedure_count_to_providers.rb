class AddProcedureCountToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :procedures_count, :integer
  end
end
