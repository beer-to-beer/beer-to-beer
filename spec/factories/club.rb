FactoryGirl.define do
  factory :club do
    name Faker::Name.name
    url Faker::Internet.url
  end
end