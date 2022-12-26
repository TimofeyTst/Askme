class User < ApplicationRecord
  has_secure_password
  has_many :questions, dependent: :destroy
  has_one_attached :avatar

  validates :nickname, presence: true
  validates :email, presence: true

  validates_uniqueness_of :email
  validates_uniqueness_of :nickname
end
