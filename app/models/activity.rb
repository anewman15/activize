class Activity < ApplicationRecord
  validates :name, presence: true, length: { in: 3..500 }
  validates :amount, presence: true
  validates :author_id, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :group
end
