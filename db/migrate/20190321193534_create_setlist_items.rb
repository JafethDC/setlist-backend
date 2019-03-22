class CreateSetlistItems < ActiveRecord::Migration[5.2]
  def change
    create_table :setlist_items do |t|
      t.references :setlist, foreign_key: true
      t.integer :type
      t.references :track, foreign_key: true
      t.string :info
      t.boolean :is_cover
      t.references :featuring_artist, foreign_key: { to_table: :artists }

      t.timestamps
    end
  end
end
