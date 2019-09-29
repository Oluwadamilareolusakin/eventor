class ChangeDateTimeToDatetimeFieldsOnEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :date, 'date USING CAST(date AS date)'
    change_column :events, :time, 'time USING CAST(time AS time)'
  end
end
