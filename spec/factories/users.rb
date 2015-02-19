FactoryGirl.define do
  factory :user do


    address = FactoryGirl.create(:address)
    email { Faker::Internet.email}
    password 'Hallo123'
    password_confirmation 'Hallo123'
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    address address
  end

end