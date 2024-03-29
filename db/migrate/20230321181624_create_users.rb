# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :zip_code
      t.string :city_name
      t.string :country
      t.string :phone

      t.timestamps
    end
  end
end
