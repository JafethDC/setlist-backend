class Artist < ApplicationRecord
  belongs_to :type, class_name: 'ArtistType', foreign_key: 'artist_type_id'
  has_many :releases, dependent: :destroy
  has_many :aliases, class_name: 'ArtistAlias', dependent: :destroy
  has_many :setlists
  has_many :media, through: :releases
  has_many :tracks, through: :media

  accepts_nested_attributes_for :releases, :aliases

  class << self
    def order_by_attendances(direction)
      joins(setlists: :attendances)
        .group(:id)
        .order(Arel.sql("COUNT(attendances.id) #{direction}"))
    end

    def with_attendances_count
      select('artists.*', 'COUNT(attendances.id) AS attendances_count')
        .joins(setlists: :attendances)
        .group(:id)
    end
  end
end
