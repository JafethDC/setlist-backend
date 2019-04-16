module Types
  class SetlistItemInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :type, String, required: true
    argument :track_id, Integer, required: false
    argument :info, String, required: false
    argument :is_cover, Boolean, required: false
    argument :featuring_artist_id, Integer, required: false
  end
end
