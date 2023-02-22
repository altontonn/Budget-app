class Group < ApplicationRecord
  belongs_to :user
  has_many :accounts, foreign_key: :group_id

  validates :name, presence: true
  validates :icon, presence: true
end
