class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :groups, foreign_key: :entity_id

  validates :name, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
