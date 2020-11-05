class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { in: 5..20 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_many :groups
  has_many :activities, foreign_key: 'author_id'
  has_many :ungrouped_activities, -> { where group: false }, class_name: 'Activity', foreign_key: 'author_id'
end
