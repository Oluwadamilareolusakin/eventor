class AddIndexOnUserIdAndEventIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_index :attendances, [:attendee_id, :event_id], unique: true
  end
end
