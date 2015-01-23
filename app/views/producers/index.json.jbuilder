json.array!(@producers) do |producer|
  json.extract! producer, :id
  json.url producer_url(producer, format: :json)
end
