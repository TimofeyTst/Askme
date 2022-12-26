class User < ApplicationRecord
  has_secure_password
  has_many :questions, dependent: :destroy

  validates_uniqueness_of :email
  validates_uniqueness_of :nickname
end
