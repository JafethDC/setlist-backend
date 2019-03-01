FactoryBot.define do
  factory :festival do
    name { Faker::FunnyName.name }
    full_name { Faker::FunnyName.name }
  end
end
