class AddCounterCacheToSetlist < ActiveRecord::Migration[5.2]
  def change
    add_column :setlists, :attendances_count, :integer
  end
end
