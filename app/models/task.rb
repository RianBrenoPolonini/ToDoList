class Task < ApplicationRecord
  belongs_to :user
  belongs_to :list

  validates :name, presence: true, length: { maximum: 50 }
end
