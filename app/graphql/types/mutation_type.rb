module Types
  class MutationType < BaseObject
    field :sign_up, mutation: Mutations::SignUp
    field :sign_in, mutation: Mutations::SignIn
    field :sign_out, mutation: Mutations::SignOut
    field :create_setlist, mutation: Mutations::CreateSetlist
    field :edit_setlist, mutation: Mutations::EditSetlist
  end
end
