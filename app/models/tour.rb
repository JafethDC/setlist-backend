class Tour < ApplicationRecord
  belongs_to :artist
  has_many :setlists
end
