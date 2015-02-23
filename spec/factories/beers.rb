FactoryGirl.define do
  factory :beer do
    title { Faker::Lorem.word}
    producer {FactoryGirl.create(:producer)}
    category {FactoryGirl.create(:category)}

  end

end
