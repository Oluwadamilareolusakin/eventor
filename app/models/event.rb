class Event < ApplicationRecord
  belongs_to :planner, class_name: 'User'
end
