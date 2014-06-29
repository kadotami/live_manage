module ApplicationHelper
  def season_string(id)
    if id == 0
      "春"
    elsif id == 1
      "夏"
    elsif id == 2
      "秋"
    end
  end

  def marubatu(bool)
    if bool
      "◯"
    else
      "☓"
    end
  end
end
