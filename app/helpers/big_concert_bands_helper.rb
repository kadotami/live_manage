module BigConcertBandsHelper
  def can_edit?(year,season)
    concert = BigConcert.find(:first, :conditions => ["year = ? and season = ?", year, season])
    return concert.can_edit
  end
end
