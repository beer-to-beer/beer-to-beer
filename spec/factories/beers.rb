FactoryGirl.define do
  factory :beer do
    title Faker::Lorem.word
    producer_id {FactoryGirl.create(:producer)}
    category_id {FactoryGirl.create(:category)}

  end

end
