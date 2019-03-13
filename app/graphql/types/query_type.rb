module Types
  class QueryType < BaseObject
    field :artists, ArtistsConnection, null: false do
      description 'Return all the artists'
      argument :order_by, ArtistOrderType, required: false
      argument :where, ArtistWhereType, required: false
    end

    field :me, UserType, null: true

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
        sleep(1)
        artists = artists.where('LOWER(name) LIKE ?', "%#{where.name_contains}%") if where.name_contains
      end

      artists
    end

    def me
      context[:current_user]
    end
  end
end
