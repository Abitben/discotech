# frozen_string_literal: true

class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_admin, :boolean
  end
end
