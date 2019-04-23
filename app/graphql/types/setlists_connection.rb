module Types
  class SetlistEdgeType < GraphQL::Types::Relay::BaseEdge
    node_type(SetlistType)
  end

  class SetlistsConnection < BaseConnection
    graphql_name 'SetlistsConnection'
    edge_type(SetlistEdgeType)
  end
end
