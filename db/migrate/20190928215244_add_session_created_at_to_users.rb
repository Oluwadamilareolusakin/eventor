# frozen_string_literal: true

class AddSessionCreatedAtToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :session_created_at, :datetime
  end
end
