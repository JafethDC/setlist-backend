class SetlistItem < ApplicationRecord
  self.inheritance_column = :_type_disabled

  belongs_to :setlist, inverse_of: :items
  belongs_to :track, optional: true
  belongs_to :featuring_artist, class_name: 'Artist', optional: true

  enum type: %i[track set tape]

  validates :type, presence: true
end
