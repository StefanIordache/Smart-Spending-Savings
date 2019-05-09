class CreateJoinTableExpenseReport < ActiveRecord::Migration[5.2]
  def change
    create_join_table :expenses, :reports do |t|
      t.index [:expense_id, :report_id]
      # t.index [:report_id, :expense_id]
    end
  end
end
