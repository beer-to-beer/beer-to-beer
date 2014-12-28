json.array!(@beers) do |beer|
  json.extract! beer, :id, :title
  json.url beer_url(beer, format: :json)
end
