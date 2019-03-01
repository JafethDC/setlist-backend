FactoryBot.define do
  factory :attendance do
    user { User.random }
    setlist { Setlist.random }
  end
end
