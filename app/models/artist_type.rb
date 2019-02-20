class ArtistType < ApplicationRecord
  has_many :artists, inverse_of: :type
end
