class Edition < ApplicationRecord
  belongs_to :user
  belongs_to :setlist
  has_one :comment, as: :commentable
end
