class User < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: [:first_name, :last_name]
  has_secure_password
  paginates_per 10
  validates :email, presence: true, uniqueness: { case_insensitive: true }
  validates :password, presence: true, length: { minimum: 6 }, if: Proc.new { |user| user.password.present? }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true, comparison: { less_than_or_equal_to: 13.years.ago }
end
