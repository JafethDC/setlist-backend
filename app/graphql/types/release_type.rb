module Types
  class ReleaseType < Types::BaseObject
    description 'A release'

    field :id, ID, null: false
    field :name, String, null: false
    field :mb_gid, String, null: false
    field :artist, ArtistType, null: false

    def artist
      RecordLoader.for(Artist).load(object.artist_id)
    end
  end
end
