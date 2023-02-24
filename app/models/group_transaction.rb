class GroupTransaction < ApplicationRecord
  # associations
  belongs_to :account
  belongs_to :category
end
