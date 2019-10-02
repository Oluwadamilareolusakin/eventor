# frozen_string_literal: true

class AddIndexOnUserIdAndEventIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_index :attendances, %i[attendee_id event_id], unique: true
  end
end
