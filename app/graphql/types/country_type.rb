module Types
  class CountryType < Types::BaseObject
    description 'A country'

    field :id, ID, null: false
    field :code, String, null: false
    field :name, String, null: false
    field :lat, Float, null: false
    field :lng, Float, null: false
    field :cities, [CityType], null: true

    def cities
      AssociationLoader.for(Country, 'cities').load(object)
    end
  end
end
