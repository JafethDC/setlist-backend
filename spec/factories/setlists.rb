FactoryBot.define do
  factory :setlist do
    artist { Artist.random }
    tour { rand(2) ? Tour.random : nil }
    festival { rand(2) ? Festival.random : nil }
    venue { Venue.random }
    date { Faker::Date.backward }
    content { Faker::Lorem.paragraph(20) }
  end
end
