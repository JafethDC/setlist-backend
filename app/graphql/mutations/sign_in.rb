module Mutations
  class SignIn < Mutations::BaseMutation
    null false

    argument :email, String, required: true
    argument :password, String, required: true

    field :session, Types::SessionType, null: true
    field :errors, [String], null: true

    def resolve(email:, password:)
      session = UserAuthenticator.new(email, password).call
      if session.present?
        context[:cookies][:token] = {
          value: session[:token],
          expires: session[:expiration_time],
          httponly: true
        }
        { session: session, errors: [] }
      else
        { session: nil, errors: ['Invalid credentials'] }
      end
    end
  end
end
