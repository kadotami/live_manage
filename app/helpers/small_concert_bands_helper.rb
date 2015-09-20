module SmallConcertBandsHelper
  def can_edit?(year,month,user_id)
    concert = SmallConcert.find(:first, :conditions => ["year = ? and month = ?", year, month])
    return (concert.can_edit and (user_id == current_user.id))
  end
end
