class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.references :medium, foreign_key: true, index: true
      t.string :mb_gid
      t.string :name
      t.integer :position
      t.integer :length

      t.timestamps
    end
  end
end
