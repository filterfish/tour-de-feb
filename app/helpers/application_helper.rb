module ApplicationHelper
  def fmt_date(date)
    (date) ? date.strftime("%d/%m/%Y") : nil
  end

  def fmt_time(time)
    (time) ? time.strftime('%l:%M%P') : nil
  end

  def hours_minutes(duration)
    (Time.mktime(0) + (duration * 60)).strftime('%H:%M')
  end

  def round(n)
    (n * 100.0).round / 100.0
  end
end
