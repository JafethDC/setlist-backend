module Types
  class FestivalType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :full_name, String, null: true
  end
end
