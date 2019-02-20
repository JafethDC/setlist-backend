class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.references :country, foreign_key: true, index: true

      t.timestamps
    end
  end
end
