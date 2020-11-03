class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 3..100 }
  validates :icon, presence: true

  has_many :activities
end
