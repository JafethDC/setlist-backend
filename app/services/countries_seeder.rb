require 'csv'

class CountriesSeeder
  def call
    path = Rails.root.join('lib', 'seeds', 'countries.csv')
    csv_text = File.read(path)
    csv = CSV.parse(csv_text, headers: true)
    p csv.map(&:to_hash)
  end
end