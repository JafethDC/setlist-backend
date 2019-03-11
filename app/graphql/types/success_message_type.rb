module Types
  class SuccessMessageType < Types::BaseObject
    description 'Simple success message'

    field :message, String, null: false
  end
end
