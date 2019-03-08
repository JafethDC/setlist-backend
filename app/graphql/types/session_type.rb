module Types
  class SessionType < Types::BaseObject
    description 'Session data'

    field :token, String, null: false
    field :expiration_time, GraphQL::Types::ISO8601DateTime, null: false
  end
end
