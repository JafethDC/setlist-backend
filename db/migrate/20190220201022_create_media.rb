class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.references :release, foreign_key: true, index: true
      t.integer :position
      t.integer :mb_id

      t.timestamps
    end
  end
end
