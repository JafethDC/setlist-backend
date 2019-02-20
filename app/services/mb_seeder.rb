require Rails.root.join('lib', 'music_brains.rb')

class MbSeeder
  def initialize
    @mb = MusicBrains.new(dbname: ENV['MB_DATABASE'], user: ENV['MB_USER'])
  end

  def call(artist_names)
    artists = @mb.artists(artist_names).uniq { |artist| artist['name'].downcase }
    artists = Hash[artists.map { |row| [row['id'], row] }]
    @mb.artist_aliases(artists.keys).each do |alias_|
      artists[alias_['artist']]['aliases'] ||= []
      artists[alias_['artist']]['aliases'] << alias_
    end
    form_release_groups(artists.keys).each do |release_group|
      artists[release_group['artist']]['releases'] ||= []
      artists[release_group['artist']]['releases'] << release_group['main_release']
    end
    artists
  end

  def form_release_groups(artist_ids)
    release_groups = @mb.artist_release_groups(artist_ids)
    release_groups.map do |release_group|
      main_release = @mb.main_release(release_group['id'])
      mediums = @mb.release_mediums(main_release['id'])
      mediums.each do |medium|
        medium['tracks'] = @mb.medium_tracks(medium['id'])
      end
      main_release['mediums'] = mediums
      release_group.merge('main_release' => main_release)
    end
  end
end