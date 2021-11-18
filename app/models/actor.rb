class Actor < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :price, presence: true
  validates :field, presence: true
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_name_and_field, against: [ :name, :field ], using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
