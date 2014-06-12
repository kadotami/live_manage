json.array!(@big_concert_bands) do |big_concert_band|
  json.extract! big_concert_band, :id, :name, :leader, :vo, :gt1, :gt2, :ba, :dr, :key, :day1, :day2, :day3, :day4, :description, :year, :season
  json.url big_concert_band_url(big_concert_band, format: :json)
end
