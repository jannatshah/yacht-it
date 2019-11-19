class Yacht < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :capacity, presence: true
  validates :location, presence: true
  validates :price_per_night, presence: true
  has_one_attached :photo
end
