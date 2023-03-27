class CreateAds < ActiveRecord::Migration[7.0]
  def change
    create_table :ads do |t|
      t.decimal :price, precision: 5, scale: 2
      t.text :description
      t.integer :status, default: 0
      t.references :copy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
