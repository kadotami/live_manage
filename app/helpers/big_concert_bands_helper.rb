module BigConcertBandsHelper
  def can_edit?(year,season,user_id)
    concert = BigConcert.find(:first, :conditions => ["year = ? and season = ?", year, season])
    return (concert.can_edit and (user_id == current_user.id))
  end
end
