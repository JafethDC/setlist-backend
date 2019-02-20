class Release < ApplicationRecord
  belongs_to :artist
  has_many :mediums
  has_many :tracks, through: :mediums
end
