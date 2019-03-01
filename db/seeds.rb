CountriesSeeder.new.call
CitiesSeeder.new.call
ArtistType.create(
  %w[Person Group Other Character Orchestra Choir].map do |name|
    { name: name }
  end
)
MbSeeder.new.call([
                    'Angel Olsen',
                    'Aphex Twin',
                    'Beach House',
                    'Boards of Canada',
                    'Broken Social Scene',
                    'CHVRCHES',
                    'Charlotte Gainsbourg',
                    'Chromatics',
                    'Courtney Barnett',
                    'Crystal Castles',
                    'Cuco',
                    'DJ Shadow',
                    'Death Cab for Cutie',
                    'Death Grips',
                    'Disclosure',
                    'Foals',
                    'Frank Ocean',
                    'Girlpool',
                    'Grimes',
                    'Grizzly Bear',
                    'James Blake',
                    'Jessica Pratt',
                    'Jorja Smith',
                    'K.Flay',
                    'Kanye West',
                    'Kendrick Lamar',
                    'LCD Soundsystem',
                    'Lorde',
                    'Niños Del Cerro',
                    'OutKast',
                    'Panda Bear',
                    'Phoenix',
                    'Radiohead',
                    'Sharon Van Etten',
                    'Snail Mail',
                    'St. Vincent',
                    'Sufjan Stevens',
                    'Sun Kil Moon',
                    'The Chemical Brothers',
                    'The Microphones',
                    'The National',
                    'The War On Drugs',
                    'The xx',
                    'Toro y Moi',
                    'Tortoise',
                    'Travis Scott',
                    'Tyler, The Creator',
                    'Wild Nothing',
                    'Yaeji',
                    'Yves Tumor'
                  ])

FactoryBot.create_list(:venue, 1000)
FactoryBot.create_list(:user, 1000)
FactoryBot.create_list(:tour, 50)
FactoryBot.create_list(:festival, 50)
FactoryBot.create_list(:setlist, 400)
FactoryBot.create_list(:attendance, 10_000)
FactoryBot.create_list(:comment, 5000)
