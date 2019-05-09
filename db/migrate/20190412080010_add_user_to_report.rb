class AddUserToReport < ActiveRecord::Migration[5.2]
  def change
    add_reference :reports, :user, index: true
  end
end
