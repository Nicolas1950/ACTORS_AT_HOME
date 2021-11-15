class User < ApplicationRecord
  has_many :actors
  has_many :bookings
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
