module Types
  class ArtistEdgeType < GraphQL::Types::Relay::BaseEdge
    node_type(ArtistType)
  end

  class ArtistsConnection < BaseConnection
    graphql_name 'ArtistsConnection'
    edge_type(ArtistEdgeType)
  end
end
