class User < ApplicationRecord
  has_many :editions
  has_many :attendances
  has_many :comments
end
