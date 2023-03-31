# frozen_string_literal: true

class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :release_id
      t.string :image_url
      t.string :title
      t.string :artist
      t.integer :year
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
