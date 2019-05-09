class Report < ApplicationRecord

  enum currency: [:ron, :euro, :usd]

  validates :title, presence: true, length: {minimum: 1, maximum: 500}
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :from_date, date: {before_or_equal_to: :to_date}
  validates :description, length: {maximum: 2000}

  belongs_to :user
  has_and_belongs_to_many :expenses

end
