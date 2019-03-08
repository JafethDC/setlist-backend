class User < ApplicationRecord
  has_secure_password

  has_many :attendances
  has_many :comments

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true
end
