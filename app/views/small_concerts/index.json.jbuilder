json.array!(@small_concerts) do |small_concert|
  json.extract! small_concert, :id, :year, :month, :can_edit
  json.url small_concert_url(small_concert, format: :json)
end
