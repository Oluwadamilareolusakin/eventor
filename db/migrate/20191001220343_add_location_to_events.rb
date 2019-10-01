class AddLocationToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_location, :string, null: false
  end
end
