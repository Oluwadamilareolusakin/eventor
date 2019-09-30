class Event < ApplicationRecord
  scope       :upcoming,    -> { where( "event_date > ?", Date.today )}
  scope       :past,        -> { where( "event_date < ?", Date.today )}
  scope       :owned_events, -> (user) { where( "self.user.id == ?", user.id ) }

  belongs_to  :planner, class_name: 'User', foreign_key: 'user_id'
  has_many    :attendances
  has_many    :attendees, through: :attendances
end
