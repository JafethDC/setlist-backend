class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :setlist, counter_cache: true
end
