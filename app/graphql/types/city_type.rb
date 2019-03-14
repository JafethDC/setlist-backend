module Types
  class CityType < Types::BaseObject
    description 'A city'

    field :id, ID, null: false
    field :name, String, null: false
    field :lat, Float, null: false
    field :lng, Float, null: false
    field :country, CountryType, null: false

    def country
      RecordLoader.for(Country).load(object.country_id)
    end
  end
end
