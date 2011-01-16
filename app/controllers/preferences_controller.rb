class PreferencesController < ApplicationController
  def edit
    @preference = current_user.preference
  end

  def update
    @preference = current_user.preference

    pp @preference
    pp params[:preference]

    if @preference.update_attributes(params[:preference])
      redirect_to(edit_preferences_url, :notice => 'Preference was successfully updated.')
    else
      render :action => "edit"
    end
  end
end
