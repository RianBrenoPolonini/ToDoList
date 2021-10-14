class List < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates :name, presence: true, length: { maximum: 50 }
end
