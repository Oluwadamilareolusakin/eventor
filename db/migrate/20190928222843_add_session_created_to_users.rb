class AddSessionCreatedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :session_created_at, :datetime
  end
end
