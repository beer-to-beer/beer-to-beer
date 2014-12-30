json.array!(@ratings) do |rating|
  json.extract! rating, :id, :beer_id, :user_id, :comment
  json.url rating_url(rating, format: :json)
end
