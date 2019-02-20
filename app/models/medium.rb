class Medium < ApplicationRecord
  belongs_to :release
  has_many :tracks
end
