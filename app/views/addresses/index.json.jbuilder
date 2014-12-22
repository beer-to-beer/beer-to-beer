json.array!(@addresses) do |address|
  json.extract! address, :id, :city, :postal_code, :street, :house_number, :country
  json.url address_url(address, format: :json)
end
