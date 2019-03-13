module Types
  class ArtistWhereType < Types::BaseInputObject
    description 'Filtering options for artists'

    argument :name_contains, String, required: false
  end
end
