class Space < ApplicationRecord
  belongs_to :user
  has_many :photos

  validates :location, presence: true
  validates :size, presence: true
  validates :type, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true
  validates :title, presence: true, length: { maximum: 50 }

end
