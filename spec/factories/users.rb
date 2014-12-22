FactoryGirl.define do
  factory :user do
    email 'test@test.de'
    password 'Hallo123'
    password_confirmation 'Hallo123'
    first_name 'Peter'
    last_name 'Mueller'
    address_id '0'

  end
end