class Setlist < ApplicationRecord
  has_many :items, -> { order(:position) }, class_name: 'SetlistItem'
  belongs_to :artist, counter_cache: true
  belongs_to :tour, optional: true
  belongs_to :festival, optional: true
  belongs_to :venue
  has_many :attendances
  has_many :comments, as: :commentable

  validates :date, presence: true
  validates :artist, uniqueness: { scope: %i[venue date], message: 'should play once per venue and date' }

  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :items

  SEARCH_AGAINST = %w[artists.name venues.name cities.name countries.name tours.name].freeze

  class << self
    def search(term)
      joins(:artist, :tour, venue: { city: :country })
        .where("LOWER(#{SEARCH_AGAINST.join(' || ')}) LIKE ?", "%#{term.downcase}%")
    end
  end
end
