json.array!(@beers) do |beer|
  json.extract! beer, :id, :title, :category_id, :producer_id
  json.url beer_url(beer, format: :json)
end
