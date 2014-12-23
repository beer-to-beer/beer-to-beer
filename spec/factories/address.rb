FactoryGirl.define do
  factory  :address do
    city Faker::Address.city
    postal_code Faker::Address.postcode
    street Faker::Address.street_name
    house_number Faker::Address.building_number
    country Faker::Address.country
  end
end