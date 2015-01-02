class ApplicationController < ActionController::Base
  protect_from_forgery

  around_filter :set_time_zone
  layout 'application'

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a? User
      if current_user.sign_in_count == 1
        flash[:notice] = "Don't forget to update goals & other details: <a href='#{edit_preferences_url}'>preferences</a>".html_safe
      end
      rides_path
    else
      super
    end
  end

  def set_time_zone
    begin
      old_time_zone = Time.zone
      Time.zone = current_user.preference.time_zone if current_user
      yield
    end
  ensure
    Time.zone = old_time_zone
  end
end
