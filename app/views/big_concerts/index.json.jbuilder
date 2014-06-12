json.array!(@big_concerts) do |big_concert|
  json.extract! big_concert, :id, :year, :season, :can_edit
  json.url big_concert_url(big_concert, format: :json)
end
