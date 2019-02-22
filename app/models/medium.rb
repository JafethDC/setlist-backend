class Medium < ApplicationRecord
  belongs_to :release
  has_many :tracks, dependent: :destroy

  accepts_nested_attributes_for :tracks
end
