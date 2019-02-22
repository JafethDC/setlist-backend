class Artist < ApplicationRecord
  belongs_to :type, class_name: 'ArtistType', foreign_key: 'artist_type_id'
  has_many :releases, dependent: :destroy
  has_many :aliases, class_name: 'ArtistAlias', dependent: :destroy

  accepts_nested_attributes_for :releases, :aliases
end
