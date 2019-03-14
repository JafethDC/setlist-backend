module Types
  class VenueType < Types::BaseObject
    description 'A venue'

    field :id, ID, null: false
    field :name, String, null: false
    field :address, String, null: false
    field :city, CityType, null: false

    def city
      RecordLoader.for(City).load(object.city_id)
    end
  end
end
