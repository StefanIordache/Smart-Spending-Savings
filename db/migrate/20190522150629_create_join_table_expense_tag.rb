class CreateJoinTableExpenseTag < ActiveRecord::Migration[5.2]
  def change
    create_join_table :expenses, :tags do |t|
      t.index [:expense_id, :tag_id]
      # t.index [:tag_id, :expense_id]
    end
  end
end
