# frozen_string_literal: true

class AddNullConstraintToEvents < ActiveRecord::Migration[6.0]
  def change
    change_column_null :events, :title, false
    change_column_null :events, :date, false
    change_column_null :events, :time, false
    change_column_null :events, :description, false
  end
end
