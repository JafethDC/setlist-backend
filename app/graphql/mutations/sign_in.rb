module Mutations
  class SignIn < Mutations::BaseMutation
    null false

    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    def resolve(email:, password:)
      result = UserAuthenticator.new(email, password).call
      if result.present?
        context[:cookies][:token] = {
          value: result[:token],
          expires: result[:expiration_time],
          httponly: true
        }
        { user: result[:user], errors: [] }
      else
        { user: nil, errors: ['Invalid credentials'] }
      end
    end
  end
end
