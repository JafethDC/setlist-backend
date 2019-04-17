module Mutations
  class EditSetlist < Mutations::BaseMutation
    null false

    argument :id, ID, required: true
    argument :items, [Types::SetlistItemInputType], required: true
    argument :comment, String, required: false

    field :setlist, Types::SetlistType, null: true
    field :errors, [String], null: true

    def resolve(id:, items:)
      setlist = Setlist.find(id)
      if setlist.update(items_attributes: items.map(&:to_h))
        { setlist: setlist, errors: [] }
      else
        { setlist: nil, errors: setlist.errors.full_messages }
      end
    end
  end
end
