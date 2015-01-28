require 'open-uri'
FactoryGirl.define do
  factory :events do
    title 'My Event'
    sdate Date.current
    imageURL {URI.parse(Faker::Avatar.image)}
    club_id nil
  end
end