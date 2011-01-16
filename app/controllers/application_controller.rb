class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_time_zone

  def set_time_zone
    if current_user
      pp current_user
      Time.zone = current_user.preference.time_zone || "UTC"
    else
      Time.zone = "UTC"
    end
  end
end
