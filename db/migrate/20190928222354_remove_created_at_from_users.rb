class RemoveCreatedAtFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :session_created_at
  end
end
