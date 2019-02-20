class Artist < ApplicationRecord
  belongs_to :type, class_name: 'ArtistType', foreign_key: :artist_type_id
  has_many :releases
  has_many :aliases, class_name: 'ArtistAlias'
end
