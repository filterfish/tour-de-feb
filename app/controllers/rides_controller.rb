class RidesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @rides = current_user.rides.order(:date,:time).all
  end

  def new
    @ride = Ride.new
  end

  def edit
    @ride = current_user.rides.find(params[:id])
    # Fucked if I know why this works.
    @ride[:distance] = @ride.distance
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

    begin
      if @ride.update_attributes(params[:ride])
        redirect_to rides_url
      else
        render :action => "edit"
      end
    rescue
      flash[:error] = "Invalid time."
      render :action => "edit"
    end
  end
end
