class CreateArtistAliases < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_aliases do |t|
      t.references :artist, foreign_key: true, index: true
      t.string :name

      t.timestamps
    end
  end
end
