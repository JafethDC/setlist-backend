class User < ApplicationRecord
  has_secure_password

  has_many :attendances
  has_many :comments

  validates :password_digest, presence: true
  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }

end
