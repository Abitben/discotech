class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.integer :release_id
      t.string :title
      t.string :artist
      t.integer :year
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
