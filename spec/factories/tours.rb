FactoryBot.define do
  factory :tour do
    artist { Artist.random }
    name { Faker::Food.fruits }
  end
end
