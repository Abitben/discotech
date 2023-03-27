class CreateCopies < ActiveRecord::Migration[7.0]
  def change
    create_table :copies do |t|
      t.references :album, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :media_condition
      t.string :sleeve_condition
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
