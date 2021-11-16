class Actor < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :field, presence: true
  has_one_attached :photo
end
