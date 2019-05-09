class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :title
      t.date :from_date
      t.date :to_date
      t.string :description
      t.integer :currency

      t.timestamps
    end
  end
end
