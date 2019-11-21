class Yacht < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :capacity, presence: true
  validates :location, presence: true
  validates :price_per_night, presence: true
  has_many_attached :photos
  has_many :reviews, dependent: :destroy

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include AlgoliaSearch
  algoliasearch do
      # list of attribute used to build an Algolia record
      # attributes :name, :location, :description,
      searchableAttributes ['name', 'location', 'unordered(description)']
  end

end
