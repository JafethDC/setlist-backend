require 'csv'

class CountriesSeeder
  def call
    path = Rails.root.join('lib', 'seeds', 'countries.csv')
    rows = CSV.parse(File.read(path), headers: true)
    countries = Country.create(
      rows.map do |country|
        {
          code: country['ISO 3166 Country Code'],
          name: country['Country'],
          lat: country['Latitude'],
          lng: country['Longitude']
        }
      end
    )
    puts "#{countries.length} countries created"
  end
end
