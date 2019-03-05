require 'graphql/batch'

class ArtistAttendancesLoader < GraphQL::Batch::Loader
  def perform(ids)
    Artist
      .select('artists.*', 'COUNT(attendances.id) AS attendances_count')
      .joins(setlists: :attendances)
      .where(id: ids)
      .group(:id)
      .each { |record| fulfill(record.id, record.attendances_count) }

    ids.each { |id| fulfill(id, nil) unless fulfilled?(id) }
  end
end