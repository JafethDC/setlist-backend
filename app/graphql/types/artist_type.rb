module Types
  class ArtistType < Types::BaseObject
    description 'An artist'

    field :id, ID, null: false
    field :name, String, null: false
    field :type, ArtistType, null: false

    def type
      RecordLoader.for(::ArtistType).load(object.artist_type_id)
    end
  end
end
