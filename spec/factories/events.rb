FactoryGirl.define do
  factory :event do
    title "Example event"
    description "This is a valid event description"
    event_date Date.today
    event_time Time.now
    user
  end
end