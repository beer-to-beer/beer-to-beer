json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :adress_id, :url, :user_id
  json.url club_url(club, format: :json)
end
