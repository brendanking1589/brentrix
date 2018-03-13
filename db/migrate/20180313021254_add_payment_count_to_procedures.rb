class AddPaymentCountToProcedures < ActiveRecord::Migration[5.0]
  def change
    add_column :procedures, :payments_count, :integer
  end
end
