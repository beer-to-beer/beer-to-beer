FactoryGirl.define do
  factory :shop do
    name "MyString"
    address {FactoryGirl.create(:address)}
  end

end
