module ApplicationHelper
  def fmt_date_time(date)
    (date) ? date.strftime("%d/%m/%Y &ndash; %H:%M").html_safe : nil
  end

  def hours_minutes(duration)
    (Time.mktime(0) + (duration * 60)).strftime('%H:%M')
  end

  def round(n)
    (n * 100.0).round / 100.0
  end
end
