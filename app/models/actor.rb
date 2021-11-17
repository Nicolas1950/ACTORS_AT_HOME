class Actor < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :field, presence: true
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
