module Types
  class QueryType < Types::BaseObject
    field :artists, [ArtistType], null: false do
      description 'Return all the artists'
    end

    def artists
      Artist.all
    end
  end
end
