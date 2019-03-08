class MbSeeder
  def initialize
    @mb = MusicBrains.new(dbname: ENV['MB_DATABASE'], user: ENV['MB_USER'])
  end

  def call(artist_names)
    attrs = artists(artist_names).select { |a| a.key?('releases') }.map do |artist|
      {
        artist_type_id: artist['type'].to_i,
        mb_gid: artist['gid'],
        name: artist['name'],
        aliases_attributes: (artist['aliases'] || []).map { |a| a.slice('name') },
        releases_attributes: artist['releases'].map do |release|
          {
            name: release['name'],
            mb_gid: release['gid'],
            media_attributes: release['mediums'].map do |medium|
              {
                position: medium['position'].to_i,
                mb_id: medium['id'].to_i,
                tracks_attributes: medium['tracks'].map do |track|
                  {
                    mb_gid: track['gid'],
                    name: track['name'],
                    position: track['position'].to_i,
                    length: track['length'].to_i
                  }
                end
              }
            end
          }
        end
      }
    end
    artists = Artist.create(attrs)
    puts "#{artists.length} artists created"
  end

  private

  def artists(names)
    artists = @mb.artists(names).uniq { |a| a['name'].downcase }
    artists = Hash[artists.map { |a| [a['id'], a] }]

    @mb.artist_aliases(artists.keys).each do |a|
      artists[a['artist']]['aliases'] ||= []
      artists[a['artist']]['aliases'] << a
    end

    release_groups(artists.keys).each do |rg|
      artists[rg['artist']]['releases'] ||= []
      artists[rg['artist']]['releases'] << rg['main_release']
    end

    artists.values
  end

  def release_groups(artists_ids)
    @mb.artist_release_groups(artists_ids).map do |release_group|
      main_release = @mb.main_release(release_group['id'])
      mediums = @mb.release_mediums(main_release['id'])
      mediums.each { |m| m['tracks'] = @mb.medium_tracks(m['id']) }
      main_release['mediums'] = mediums
      release_group.merge('main_release' => main_release)
    end
  end
end
