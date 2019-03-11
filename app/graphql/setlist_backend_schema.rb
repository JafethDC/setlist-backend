require 'graphql/batch'

class SetlistBackendSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Batch

  def self.inaccessible_fields(error)
    if error.fields.any?(&:private)
      message = 'Please sign in'
    else
      message = 'Inaccessible data'
    end
    GraphQL::AnalysisError.new(message)
  end
end

GraphQL::Relay::ConnectionType.bidirectional_pagination = true
