FactoryGirl.define do
  factory  :address do
    city Faker::Address.city
    postal_code 48143
    street Faker::Address.street_name
    house_number Faker::Address.building_number
    country Faker::Address.country
  end
end