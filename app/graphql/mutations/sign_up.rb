module Mutations
  class SignUp < Mutations::BaseMutation
    null false

    argument :name, String, required: true
    argument :username, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    def resolve(name:, username:, email:, password:, password_confirmation:)
      user = User.new(name: name,
                      username: username,
                      email: email,
                      password: password,
                      password_confirmation: password_confirmation
                    )
      if user.save
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
