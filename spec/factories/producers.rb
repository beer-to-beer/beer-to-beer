FactoryGirl.define do
  factory :producer do
    name Faker::Lorem.word
    address {FactoryGirl.create(:address)}
  end

end
