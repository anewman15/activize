class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 3..100 }

  # belongs_to :user
  has_one_attached :icon
  has_many :activities
end
