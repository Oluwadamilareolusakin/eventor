FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name  { Faker::Name.name }
    username 'ausername1'
    admin false
  end

  factory :admin do
    email { Faker::Internet.email }
    name  { Faker::Name.name }
    username 'ausername2'
    admin true
  end
end