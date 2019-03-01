FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph(7) }
    user { User.random }
    commentable { [Setlist].sample.random }
  end
end
