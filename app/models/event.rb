class Event < ApplicationRecord
  scope       :upcoming,    -> { where( "event_date > ?", Date.today )}
  scope       :past,        -> { where( "event_date < ?", Date.today )}

  belongs_to  :planner, class_name: 'User', foreign_key: 'user_id'
  has_many    :attendances
  has_many    :attendees, through: :attendances
end