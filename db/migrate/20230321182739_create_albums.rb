class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.integer :release_id
      t.string :title
      t.string :artist
      t.integer :year

      t.timestamps
    end
  end
end
