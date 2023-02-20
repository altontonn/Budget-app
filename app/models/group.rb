class Group < ApplicationRecord
  belongs_to :user
  belongs_to :entity
  has_many :entities, foreign_key: :group_id

  validates :name, presence: true
  validates :icon, presence: true
end
