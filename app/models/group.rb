class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 3..100 }
  validates :icon, presence: true
  validates_uniqueness_of :name, scope: :author_id

  belongs_to :author, class_name: 'User'
  has_one_attached :icon
  has_many :activities

  def activities_duration_total
    amount_array = activities.map { |activity| activity.amount.to_i }
    amount_array.sum
  end
end
