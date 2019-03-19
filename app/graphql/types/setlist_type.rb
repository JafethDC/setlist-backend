module Types
  class SetlistType < Types::BaseObject
    description 'A setlist'

    field :id, ID, null: false
    field :date, DateType, null: false
    field :artist, ArtistType, null: false
    field :venue, VenueType, null: false
    field :comments, [CommentType], null: true

    def comments
      AssociationLoader.for(Setlist, 'comments').load(object)
    end
  end
end
