FactoryGirl.define do
  factory :club do
    name 'My Club'
    url Faker::Internet.url
  end
end