module Types
  class QueryType < BaseObject
    field :artists, ArtistsConnection, null: false do
      description 'Return all the artists'

      argument :order_by, ArtistOrderType, required: false
    end

    def artists(order_by: nil)
      artists = Artist.all
      return artists if order_by.nil?

      if order_by.field == 'ATTENDANCES_COUNT'
        artists.order_by_attendances(order_by.direction)
      else
        artists.order("#{order_by.field} #{order_by.direction}")
      end
    end
  end
end
