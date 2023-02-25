class Account < ApplicationRecord
  belongs_to :user
  has_many :group_transactions, foreign_key: :account_id
  has_many :groups, through: :group_transaction, foreign_key: :account_id

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
