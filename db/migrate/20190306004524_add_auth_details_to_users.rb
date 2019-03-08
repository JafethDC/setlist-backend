class AddAuthDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_column :users, :reset_token, :string
    add_column :users, :reset_token_expiry, :datetime

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
