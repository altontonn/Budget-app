class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable

  has_many :groups, foreign_key: :user_id
  has_many :entities, foreign_key: :user_id

  validates :name, presence: true
end
