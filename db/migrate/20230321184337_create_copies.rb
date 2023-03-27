class CreateCopies < ActiveRecord::Migration[7.0]
  def change
    create_table :copies do |t|
      t.references :album, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :media_condition, default: 0
      t.integer :sleeve_condition, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
