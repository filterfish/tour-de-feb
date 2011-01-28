module ApplicationHelper
  def fmt_date(date)
    date.strftime("%a %d %B %Y")
  end

  def fmt_time(date)
    date.strftime("%H:%M")
  end

  def hours_minutes(duration)
    (Time.mktime(0) + (duration * 60)).strftime('%H:%M')
  end
end
