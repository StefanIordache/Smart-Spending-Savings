class Tag < ApplicationRecord
    validates :title, presence: true, length: { minimum: 1, maximum: 500}

    belongs_to :user
    has_and_belongs_to_many :expenses
end
