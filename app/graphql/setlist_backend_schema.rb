require 'graphql/batch'

class SetlistBackendSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Batch
end

GraphQL::Relay::ConnectionType.bidirectional_pagination = true
