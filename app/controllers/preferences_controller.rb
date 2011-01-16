class PreferencesController < ApplicationController
  def edit
    @preference = current_user.preference
  end

  def update
    @preference = current_user.preference

    if @preference.update_attributes(params[:preference])
      redirect_to(rides_url, :notice => 'Preference was successfully updated.')
    else
      render :action => "edit"
    end
  end
end
