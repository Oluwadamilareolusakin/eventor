# frozen_string_literal: true

class AddEmailIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :email
  end
end
