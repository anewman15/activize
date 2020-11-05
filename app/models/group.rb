class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 3..100 }
  validates :icon, presence: true

  belongs_to :user
  has_many :activities
end
