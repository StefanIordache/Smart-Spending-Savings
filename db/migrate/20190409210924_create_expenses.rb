class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :title
      t.string :description
      t.decimal :amount
      t.date :expense_date
      t.integer :currency

      t.timestamps
    end
  end
end
