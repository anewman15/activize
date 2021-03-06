class Activity < ApplicationRecord
  validates :name, presence: true, length: { in: 3..500 }
  validates :amount, presence: true, numericality: { greater_than: 9 }
  validates :author_id, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true

  scope :latest_first, -> { order(created_at: :desc) }
  scope :with_group, -> { includes :group }
end
