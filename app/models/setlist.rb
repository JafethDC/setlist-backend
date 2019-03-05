class Setlist < ApplicationRecord
  belongs_to :artist, counter_cache: true
  belongs_to :tour, optional: true
  belongs_to :festival, optional: true
  belongs_to :venue
  has_many :attendances
  has_many :comments, as: :commentable
end
