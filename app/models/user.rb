class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { in: 5..20 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_many :groups, foreign_key: 'author_id'
  has_many :activities, foreign_key: 'author_id'
  has_many :ungrouped_activities, -> { where group_id: nil }, class_name: 'Activity', foreign_key: 'author_id'

  def find_group(params)
    groups.find { |group| group if group.id == params[:id].to_i }
  end

  def activities_duration_total
    amount_array = activities.map { |activity| activity.amount.to_i }
    amount_array.sum
  end

  def ungrouped_activities_duration_total
    amount_array = ungrouped_activities.map { |activity| activity.amount.to_i }
    amount_array.sum
  end
end
