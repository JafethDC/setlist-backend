class MusicBrains
  def initialize(params)
    @connection = PG.connect(params)
  end

  def artist_types
    result = @connection.exec %(
      SELECT id, name
      FROM artist_type;
    )
    result.entries
  end

  def artist_aliases(artist_ids)
    result = @connection.exec %(
      SELECT id, name, artist, type
      FROM artist_alias
      WHERE artist IN (#{in_param(artist_ids)})
      AND (type IS NULL OR type <> 2);
    )
    result.entries
  end

  def artists(names)
    result = @connection.exec %(
      SELECT id, gid, name, type
      FROM artist
      WHERE LOWER(name) IN (#{in_param(names.map(&:downcase))});
    )
    result.entries
  end

  def artist_release_groups(artist_ids)
    result = @connection.exec %(
      SELECT release_group.id, release_group.gid, release_group."name", artist.id AS artist
      FROM release_group
      JOIN release_group_primary_type ON release_group."type" = release_group_primary_type.id
      JOIN artist_credit ON release_group.artist_credit = artist_credit.id
      JOIN artist_credit_name ON artist_credit_name.artist_credit = artist_credit.id
      JOIN artist ON artist_credit_name.artist = artist.id
      LEFT JOIN release_group_secondary_type_join ON release_group_secondary_type_join.release_group = release_group.id
      WHERE artist.id IN (#{in_param(artist_ids)})
      AND release_group_primary_type.id IN (1, 3)
      AND release_group_secondary_type_join.secondary_type IS NULL
      ORDER BY release_group."name" ASC;
    )
    result.entries
  end

  def main_release(release_group_id)
    result = @connection.exec %(
      SELECT "release".id, "release"."name", "release".gid
      FROM "release"
      JOIN release_group ON "release".release_group = release_group.id
      JOIN medium ON medium."release" = "release".id
      WHERE release_group.id = #{release_group_id}
      GROUP BY "release".id
      ORDER BY COUNT("release".id) DESC
      LIMIT 1;
    )
    result.entries.first
  end

  def release_mediums(release_id)
    result = @connection.exec %(
      SELECT id, position
      FROM medium
      WHERE release = #{release_id};
    )
    result.entries
  end

  def medium_tracks(medium_id)
    result = @connection.exec %(
        SELECT id, gid, name, position, length
        FROM track
        WHERE medium = #{medium_id}
    )
    result.entries
  end

  private

  def in_param(list)
    mapper = list.first.is_a?(String) ? proc { |item| "'#{item}'" } : proc { |item| item }
    list.map(&mapper).join(',')
  end
end
