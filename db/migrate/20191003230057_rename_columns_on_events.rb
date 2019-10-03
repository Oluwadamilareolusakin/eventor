class RenameColumnsOnEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :event_date, :date
    rename_column :events, :event_time, :time
  end
end
