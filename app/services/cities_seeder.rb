require 'csv'

class CitiesSeeder
  def call
    path = Rails.root.join('lib', 'seeds', 'cities.csv')
    csv_text = File.read(path)
    csv = CSV.parse(csv_text, headers: true)
    p csv.map(&:to_hash)
  end
end