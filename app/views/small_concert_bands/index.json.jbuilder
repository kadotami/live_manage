json.array!(@small_concert_bands) do |small_concert_band|
  json.extract! small_concert_band, :id, :name, :song, :leader, :vo, :gt1, :gt2, :ba, :dr, :key, :week1, :week2, :description, :year, :month
  json.url small_concert_band_url(small_concert_band, format: :json)
end
