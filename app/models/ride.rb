class Ride < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :date

  def validate
    if length.nil? && duration.nil?
      errors.add_to_base("You must supply either a distance or duration")
    end
  end
end
