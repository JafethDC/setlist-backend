require Rails.root.join('lib', 'music_brains.rb')
require Rails.root.join('app', 'services', 'mb_seeder.rb')

artists = [
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
  'Nios Del Cerro',
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
]

desc 'Seed db from musicbrainz database'
task :mb_seed do |_, _|
  seeder = MbSeeder.new
  p seeder.call(artists)
end
