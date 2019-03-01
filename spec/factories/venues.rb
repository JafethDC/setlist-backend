FactoryBot.define do
  factory :venue do
    name { Faker::Address.community }
    address { Faker::Address.street_address }
    city { City.random }
  end
end
