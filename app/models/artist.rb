class Artist < ApplicationRecord
  belongs_to :type, class_name: 'ArtistType', foreign_key: 'artist_type_id'
  has_many :releases, dependent: :destroy
  has_many :aliases, class_name: 'ArtistAlias', dependent: :destroy
  has_many :setlists

  accepts_nested_attributes_for :releases, :aliases

  class << self
    def order_by_attendances(direction)
      joins(setlists: :attendances)
        .group(:id)
        .order("COUNT(attendances.id) #{direction}")
    end
  end
end
