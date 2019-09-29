class SetNullConstraintOnEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :title, :string, null: false
    change_column :events, :description, :string, null: false
    change_column :events, :date, :string, null: false
    change_column :events, :time, :string, null: false
  end
end
