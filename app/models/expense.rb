class Expense < ApplicationRecord

  enum currency: [:ron, :euro, :usd]

  validates :title, presence: true, length: {minimum: 1, maximum: 500}
  validates :amount, presence: true
  validates :description, length: {maximum: 2000}
  validates :expense_date, presence: true

  belongs_to :user
  has_and_belongs_to_many :reports

end
