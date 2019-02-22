module Types
  class ArtistTypeType < Types::BaseObject
    description "An artist's type"

    field :id, ID, null: false
    field :name, String, null: false
  end
end
