module Types
  class QueryType < BaseObject
    field :artists, ArtistsConnection, null: false do
      description 'Return all the artists'
      argument :order_by, ArtistOrderType, required: false
      argument :where, ArtistWhereType, required: false
    end

    field :setlists, SetlistsConnection, null: false do
      argument :search_query, String, required: false
      argument :order_by, SetlistOrderType, required: false
    end

    field :setlist, SetlistType, null: true do
      argument :where, SetlistWhereUniqueType, required: true
    end

    field :tracks, TrackType.connection_type, null: true do
      argument :where, TrackWhereType, required: false
    end

    field :me, UserType, null: true
    field :countries, CountryType.connection_type, null: false
    field :cities, CityType.connection_type, null: false
    field :venues, VenueType.connection_type, null: false do
      argument :where, VenueWhereType, required: false
    end

    def artists(order_by: nil, where: nil)
      artists = Artist.all

      if order_by
        if order_by.field == 'ATTENDANCES_COUNT'
          artists = artists.order_by_attendances(order_by.direction)
        else
          artists = artists.order("#{order_by.field} #{order_by.direction}")
        end
      end

      if where
        artists = artists.where('LOWER(name) LIKE ?', "%#{where.name_contains}%") if where.name_contains
      end

      artists
    end

    def setlists(search_query: nil, order_by: nil)
      setlists = Setlist.all
      setlists = setlists.search(search_query) if search_query
      setlists = setlists.order("#{order_by.field} #{order_by.direction}") if order_by
      setlists
    end

    def setlist(where:)
      Setlist.find_by(where.to_h)
    end

    def me
      context[:current_user]
    end

    def countries
      Country.all
    end

    def cities
      City.all
    end

    def venues(where: nil)
      venues = Venue.all
      if where
        venues = venues.search_by_full_name(where.full_name_contains) if where.full_name_contains
      end
      venues
    end

    def tracks(where: nil)
      tracks = Track.all
      if where
        if where.artist_id
          tracks = tracks.joins(medium: { release: :artist }).where(releases: { artist_id: where.artist_id })
        end
        tracks = tracks.where('LOWER(tracks.name) LIKE ?', "%#{where.name_contains}%") if where.name_contains
      end
      tracks
    end
  end
end
