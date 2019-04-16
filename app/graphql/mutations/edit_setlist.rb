module Mutations
  class EditSetlist < Mutations::BaseMutation
    null false

    argument :id, Integer, required: true
    argument :items, [Types::SetlistItemInputType], required: true
    argument :comment, String, required: false

    field :setlist, Types::SetlistType, null: true
    field :errors, [String], null: true

    def resolve(id:, items:, comment: '')
      setlist = Setlist.find(id)
      { setlist: setlist, errors: [] }
    end
  end
end
