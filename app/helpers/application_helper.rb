module ApplicationHelper
  def fmt_date(date)
    date.strftime("%a %d %B %Y")
  end

  def fmt_time(date)
    date.strftime("%H:%M")
  end

  def kms_or_miles
    (current_user.preference.metric) ? "kms" : "miles"
  end
end
