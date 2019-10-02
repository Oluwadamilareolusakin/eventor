# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title { 'Example event' }
    description { 'This is a valid event description' }
    event_date { Date.today }
    event_time { Time.now }
    location { 'Some Location' }
  end
end
