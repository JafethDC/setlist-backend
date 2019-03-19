module Types
  class CommentType < Types::BaseObject
    description 'A generic comment'

    field :id, ID, null: false
    field :body, String, null: false
    field :user, UserType, null: false
  end
end
