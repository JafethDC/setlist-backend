class AddCounterCacheToArtist < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :setlists_count, :integer, default: 0
  end
end
