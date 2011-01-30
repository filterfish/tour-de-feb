class Ride < ActiveRecord::Base
  belongs_to :user

  before_validation :update_time

  def validate
    if distance.nil? && duration.nil?
      errors.add_to_base("You must supply either a distance or duration")
    end
  end

  def date=(date)
    write_attribute(:date, Chronic.parse(date))
  end

  def distance=(distance)
    write_attribute(:distance, (user.preference.metric == 'km') ? distance : distance * 1.6)
  end

  def distance
    d = read_attribute(:distance)
    (user.preference.metric == 'km') ? d : d / 1.6
  end

  def duration_hours=(hours)
    @hours = hours
  end

  def duration_minutes=(minutes)
    @minutes = minutes
  end

  def duration_hours
    if self.duration
      hours = self.duration / 60
      (hours == 0) ? nil : hours
    else
      nil
    end
  end

  def duration_minutes
    if self.duration
      minutes = self.duration % 60
      (minutes == 0) ? nil : minutes
    else
      nil
    end
  end

  private

  def update_time
    self.duration = @hours.to_i * 60 + @minutes.to_i
  end
end
