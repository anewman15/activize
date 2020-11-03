class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { in: 5..20 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :confirm_password, presence: true

  has_many :activities, foreign_key: 'author_id'
end
