module ApplicationHelper
  def fmt_date(date)
    date.strftime("%a %d %b %Y")
  end

  def fmt_time(date)
    date.strftime("%H:%M")
  end

  def hours_minutes(duration)
    (Time.mktime(0) + (duration * 60)).strftime('%H:%M')
  end

  def round(n)
    (n * 100.0).round / 100.0
  end
end
