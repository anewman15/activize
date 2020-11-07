class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 3..100 }
  validates :icon, presence: true
  validates_uniqueness_of :name, scope: :author_id

  belongs_to :author, class_name: 'User'
  has_one_attached :icon
  has_many :activities
end
