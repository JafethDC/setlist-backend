FactoryBot.define do
  factory :setlist do
    artist { Artist.random }
    tour { rand(2) ? Tour.random : nil }
    festival { rand(2) ? Festival.random : nil }
    venue { Venue.random }
    date { Faker::Date.backward }

    factory :setlist_with_items do
      after(:create) do |setlist|
        create_list(:setlist_item, rand(15..22), setlist: setlist)
      end
    end
  end
end
