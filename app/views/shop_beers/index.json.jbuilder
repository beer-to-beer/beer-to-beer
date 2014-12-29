json.array!(@shop_beers) do |shop_beer|
  json.extract! shop_beer, :id, :shop_id, :beer_id
  json.url shop_beer_url(shop_beer, format: :json)
end
