FactoryBot.define do
  factory :city do
    name { "MyString" }
    lat { 1.5 }
    lng { 1.5 }
    country { nil }
  end
end
