# frozen_string_literal: true

class Remove < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :event_location
  end
end
