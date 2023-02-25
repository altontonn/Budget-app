class Group < ApplicationRecord
  belongs_to :user
  has_many :group_transactions, foreign_key: :group_id
  has_many :accounts, through: :group_transactions, foreign_key: :group_id

  has_one_attached :icon

  validates :name, presence: true
  validates :icon, presence: true

  def ordered_transactions
    accounts.order(created_at: :desc)
  end
end
