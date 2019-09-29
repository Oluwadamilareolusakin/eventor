class Event < ApplicationRecord
  belongs_to :planner, class_name: 'User', foreign_key: 'user_id'
end
