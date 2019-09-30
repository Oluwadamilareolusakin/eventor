class Event < ApplicationRecord
  belongs_to :planner, class_name: 'User', foreign_key: 'user_id'
  has_many :attendances
  has_many :attendees, through: :attendances
end
