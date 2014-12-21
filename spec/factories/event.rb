FactoryGirl.define do
  factory :event do
    title 'My Event'
    sdate Date.current
    club_id nil
  end
end