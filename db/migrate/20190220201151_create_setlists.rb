class CreateSetlists < ActiveRecord::Migration[5.2]
  def change
    create_table :setlists do |t|
      t.references :artist, foreign_key: true, index: true
      t.references :tour, foreign_key: true, index: true
      t.references :festival, foreign_key: true, index: true
      t.references :venue, foreign_key: true, index: true
      t.date :date
      t.text :content

      t.timestamps
    end
  end
end
