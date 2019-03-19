module Mutations
  class CreateSetlist < Mutations::BaseMutation
    null false

    argument :artist_id, Integer, required: true
    argument :venue_id, Integer, required: true
    argument :date, Types::DateType, required: true
    argument :comment, String, required: false

    field :setlist, Types::SetlistType, null: true
    field :errors, [String], null: true

    def resolve(artist_id:, venue_id:, date:, comment:)
      params = { artist_id: artist_id, venue_id: venue_id, date: date }
      params[:comments_attributes] = [{ body: comment, user: context[:current_user] }] if comment
      setlist = Setlist.new(params)
      if setlist.save
        { setlist: setlist, errors: [] }
      else
        { setlist: nil, errors: setlist.errors.full_messages }
      end
    end
  end
end
