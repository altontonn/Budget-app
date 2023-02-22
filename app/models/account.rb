class Account < ApplicationRecord
  belongs_to :user
  has_many :groups, foreign_key: :account_id

  validates :name, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
