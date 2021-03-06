FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.username(name) }
    email { Faker::Internet.email(name) }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
