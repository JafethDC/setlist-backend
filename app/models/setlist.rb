class Setlist < ApplicationRecord
  belongs_to :artist
  belongs_to :tour
  belongs_to :festival
  belongs_to :venue
  has_many :attendances
  has_many :editions
  has_many :comments, as: :commentable
end
