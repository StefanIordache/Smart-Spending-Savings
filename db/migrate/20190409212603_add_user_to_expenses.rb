class AddUserToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_reference :expenses, :user, index: true
  end
end
