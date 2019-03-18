class Venue < ApplicationRecord
  belongs_to :city
  has_many :setlists

  def self.search_by_full_name(term)
    joins(city: :country)
      .where(
        'LOWER(CONCAT(venues.name, cities.name, countries.name)) LIKE ?',
        "%#{term}%"
      )
  end
end
