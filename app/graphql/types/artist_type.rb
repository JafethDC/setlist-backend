module Types
  class ArtistType < Types::BaseObject
    @attendances_count_params = {
      where: lambda(&:with_attendances_count)
    }

    class << self
      attr_accessor :attendances_count_params
    end

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
      RecordLoader.for(Artist, ArtistType.attendances_count_params)
                  .load(object.id)
                  .then(&:attendances_count)
    end
  end
end
