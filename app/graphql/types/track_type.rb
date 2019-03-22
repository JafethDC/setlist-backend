module Types
  class TrackType < Types::BaseObject
    description 'A track'

    field :id, ID, null: false
    field :name, String, null: false
    field :position, Integer, null: false
    field :length, Integer, null: false
    field :mb_gid, String, null: false
    field :medium, MediumType, null: false

    def medium
      RecordLoader.for(Medium).load(object.medium_id)
    end
  end
end
