# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name  { Faker::Name.name }
    username { 'ausername1' }
  end

  factory :admin do
    email { Faker::Internet.email }
    name  { Faker::Name.name }
    username { 'ausername2' }
    admin { true }
  end
end
