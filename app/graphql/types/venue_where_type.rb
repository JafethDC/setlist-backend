module Types
  class VenueWhereType < Types::BaseInputObject
    description 'Filtering options for venues'

    argument :full_name_contains, String, required: false
  end
end
