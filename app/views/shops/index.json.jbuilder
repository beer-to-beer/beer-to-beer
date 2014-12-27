json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :address_id
  json.url shop_url(shop, format: :json)
end
