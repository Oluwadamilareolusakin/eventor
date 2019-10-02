# frozen_string_literal: true

class RemoveDateTimeFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :date
    remove_column :events, :time
  end
end
