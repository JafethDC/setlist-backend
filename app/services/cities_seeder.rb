require 'csv'

class CitiesSeeder
  def call
    path = Rails.root.join('lib', 'seeds', 'cities.csv')
    rows = CSV.parse(File.read(path), headers: true)
    countries = Hash[Country.all.map { |c| [c.code, c] }]
    cities_attrs = []
    rows.each do |city|
      next unless countries.key?(city['iso2'])

      cities_attrs << {
        name: city['city_ascii'],
        lat: city['lat'],
        lng: city['lng'],
        country_id: countries[city['iso2']].id
      }
    end
    cities = City.create(cities_attrs)
    puts "#{cities.length} cities created"
  end
end
