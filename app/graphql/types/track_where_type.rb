module Types
  class TrackWhereType < Types::BaseInputObject
    description 'Filtering options for tracks'

    argument :name_contains, String, required: false
    argument :artist_id, Integer, required: false
  end
end
