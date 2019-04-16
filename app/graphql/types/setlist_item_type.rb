module Types
  class SetlistItemType < Types::BaseObject
    description 'A setlist'

    field :id, ID, null: false
    field :type, String, null: false
    field :track, TrackType, null: true
    field :info, String, null: true
    field :is_cover, Boolean, null: true
    field :featuring_artist, ArtistType, null: true
    field :position, Integer, null: false

    def track
      RecordLoader.for(Track).load(object.track_id)
    end

    def featuring_artist
      RecordLoader.for(Artist).load(object.featuring_artist_id)
    end
  end
end
