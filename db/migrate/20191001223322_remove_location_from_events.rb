# frozen_string_literal: true

class RemoveLocationFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :location
  end
end
