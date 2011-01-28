class Ride < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :date

  def validate
    if distance.nil? && duration.nil?
      errors.add_to_base("You must supply either a distance or duration")
    end
  end

  def distance=(distance)
    write_attribute(:distance, (user.preference.metric == 'km') ? distance : distance * 1.6)
  end

  def distance
    d = read_attribute(:distance)
    (user.preference.metric == 'km') ? d : d / 1.6
  end
end
