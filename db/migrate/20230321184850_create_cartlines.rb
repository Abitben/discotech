class CreateCartlines < ActiveRecord::Migration[7.0]
  def change
    create_table :cartlines do |t|
      t.references :collection, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
