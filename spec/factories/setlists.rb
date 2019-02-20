FactoryBot.define do
  factory :setlist do
    artist { nil }
    tour { nil }
    festival { nil }
    venue { nil }
    date { "2019-02-20" }
    content { "MyText" }
  end
end
