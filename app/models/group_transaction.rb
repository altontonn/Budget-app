class GroupTransaction < ApplicationRecord
   validates :account, uniqueness: { scope: :group, message: 'already exists in this category' }
   # associations
   belongs_to :group
   belongs_to :account
end
