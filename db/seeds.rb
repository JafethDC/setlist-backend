require 'csv'

CountriesSeeder.new.call
CitiesSeeder.new.call
ArtistType.create(
  %w[Person Group Other Character Orchestra Choir].map do |name|
    { name: name }
  end
)

artists = CSV.parse(
  File.read(Rails.root.join('lib', 'seeds', 'artists.csv')),
  headers: true
)
MbSeeder.new.call(artists['name'])

FactoryBot.create_list(:venue, 1000)
FactoryBot.create_list(:user, 1000)
FactoryBot.create_list(:tour, 50)
FactoryBot.create_list(:festival, 50)
FactoryBot.create_list(:setlist, 400)
FactoryBot.create_list(:attendance, 10_000)
FactoryBot.create_list(:comment, 5000)
