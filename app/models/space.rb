class Space < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  validates :location, presence: true
  validates :size, presence: true
  validates :space_type, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true
  validates :title, presence: true, length: { maximum: 50 }
end
