class AddLocationToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :location, :string, null: false
  end
end
