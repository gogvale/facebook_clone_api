class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: { case_insensitive: true }
  validates :password, presence: true, length: { minimum: 6 }, if: Proc.new{ |user| user.password.present? }
end
