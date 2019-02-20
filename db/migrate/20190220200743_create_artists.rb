class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.references :artist_type, foreign_key: true, index: true
      t.string :mb_gid
      t.string :name

      t.timestamps
    end
  end
end
