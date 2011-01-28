class GroupsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @group = Group.where(['name = ?', params[:name]]).first
    @users = @group.try(:users)

    if @users && @users.size > 0
      @kms_miles_or_both = get_distance_metric(@users)
    else
      flash[:error] = "Sorry that group doesn't exist"
      redirect_to rides_url
    end
  end

  def new
    @ride = Ride.new
  end

  def edit
    @ride = current_user.rides.find(params[:id])
  end

  def create
    @ride = current_user.rides.new(params[:ride])

    if @ride.save
      redirect_to rides_url
    else
      render :action => "new"
    end
  end

  def update
    @ride = current_user.rides.find(params[:id])

    if @ride.update_attributes(params[:ride])
      redirect_to rides_url
    else
      render :action => "edit"
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
