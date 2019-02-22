class Release < ApplicationRecord
  belongs_to :artist
  has_many :media, dependent: :destroy
  has_many :tracks, through: :media

  accepts_nested_attributes_for :media
end
