class GroupsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @group = Group.where(['name ~* ?', params[:name]]).first
    @users = @group.try(:users)

    if @users && @users.size > 0 && current_user.group.name.downcase == params[:name].downcase
      @kms_miles_or_both = get_distance_metric(@users)
    else
      flash[:error] = "Sorry that group doesn't exist"
      redirect_to rides_url
    end
  end

  private

  def get_distance_metric(users)
    k_or_m = users.map { |u| u.preference.metric}
    uniq_k_or_m = k_or_m.uniq
    if uniq_k_or_m.size > 1
      :both
    elsif uniq_k_or_m.size == 1 && uniq_k_or_m.first == 'km'
      :metric
    else
      @imperial = 'miles'
    end
  end
end
