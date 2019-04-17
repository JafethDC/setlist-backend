module Types
  class SetlistType < Types::BaseObject
    description 'A setlist'

    field :id, ID, null: false
    field :date, DateType, null: false
    field :artist, ArtistType, null: false
    field :venue, VenueType, null: false
    field :comments, [CommentType], null: true
    field :items, [SetlistItemType], null: true

    def artist
      RecordLoader.for(Artist).load(object.artist_id)
    end

    def venue
      RecordLoader.for(Venue).load(object.venue_id)
    end

    def comments
      AssociationLoader.for(Setlist, 'comments').load(object)
    end

    # For some reason, this was causing to duplicate the items
    # during a setlist update
    # def items
    #   AssociationLoader.for(Setlist, 'items').load(object)
    # end
  end
end
