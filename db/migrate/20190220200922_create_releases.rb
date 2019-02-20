class CreateReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :releases do |t|
      t.string :name
      t.references :artist, foreign_key: true, index: true
      t.string :mb_gid

      t.timestamps
    end
  end
end
