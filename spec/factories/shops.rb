FactoryGirl.define do
  factory :shop do
    name "MyString"
    email Faker::Internet.email
    phonenumber Faker::Number.number(10)
    website Faker::Internet.domain_name
    address {FactoryGirl.create(:address)}
  end

end
