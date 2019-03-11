module Mutations
  class SignOut < GraphQL::Schema::Mutation
    null false

    payload_type Types::SuccessMessageType

    def resolve
      context[:cookies].delete(:token)
      { message: 'Good bye!' }
    end
  end
end
