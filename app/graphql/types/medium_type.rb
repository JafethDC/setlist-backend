module Types
  class MediumType < Types::BaseObject
    description 'A medium'

    field :id, ID, null: false
    field :position, Integer, null: false
    field :mb_id, String, null: false
    field :release, ReleaseType, null: false

    def release
      RecordLoader.for(Release).load(object.release_id)
    end
  end
end
