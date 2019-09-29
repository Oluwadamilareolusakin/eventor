class AddDateTimeFromEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_date, :date, null: false
    add_column :events, :event_time, :time, null: false
    add_index :events, :event_date
    add_index :events, :event_time
  end
end
