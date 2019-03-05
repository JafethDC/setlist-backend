module Types
  class ArtistOrderType < Types::BaseInputObject
    description 'Ordering options for artists'

    argument :field, ArtistOrderFieldEnum, required: true
    argument :direction, OrderDirectionEnum, required: true
  end
end
