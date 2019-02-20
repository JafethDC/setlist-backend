class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.references :city, foreign_key: true, index: true

      t.timestamps
    end
  end
end
