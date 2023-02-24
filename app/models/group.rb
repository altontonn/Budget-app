class Group < ApplicationRecord
  belongs_to :user
  has_many :accounts, foreign_key: :group_id

  has_one_attached :icon

  validates :name, presence: true
  validates :icon, presence: true
end
