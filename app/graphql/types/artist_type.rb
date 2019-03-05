module Types
  class ArtistType < Types::BaseObject
    description 'An artist'

    field :id, ID, null: false
    field :name, String, null: false
    field :type, ArtistType, null: false
    field :setlists_count, Integer, null: false
    field :attendances_count, Integer, null: false

    def type
      RecordLoader.for(::ArtistType).load(object.artist_type_id)
    end

    def attendances_count
      ArtistAttendancesLoader.for.load(object.id)
    end
  end
end
