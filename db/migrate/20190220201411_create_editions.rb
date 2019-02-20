class CreateEditions < ActiveRecord::Migration[5.2]
  def change
    create_table :editions do |t|
      t.references :user, foreign_key: true, index: true
      t.references :setlist, foreign_key: true, index: true
      t.date :date

      t.timestamps
    end
  end
end
