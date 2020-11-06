class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 3..100 }
  validates :icon, presence: true

  # belongs_to :user
  has_one_attached :icon
  has_many :activities
end
