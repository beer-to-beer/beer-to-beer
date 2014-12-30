json.array!(@criterions) do |criterion|
  json.extract! criterion, :id, :rating_id, :name, :value
  json.url criterion_url(criterion, format: :json)
end
