module SmallConcertBandsHelper
  def can_edit?(year,month)
    concert = SmallConcert.find(:first, :conditions => ["year = ? and month = ?", year, month])
    return concert.can_edit
  end
end
