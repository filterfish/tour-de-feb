class RidesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def new
    @ride = Ride.new
  end

  def edit
    @ride = Ride.find(params[:id])
  end

  def create
    @ride = Ride.new(params[:ride])

    if @ride.save
      redirect_to rides_url
    else
      render :action => "new"
    end
  end

  def update
    @ride = Ride.find(params[:id])

    if @ride.update_attributes(params[:ride])
      redirect_to rides_url
    else
      render :action => "edit"
    end
  end
end
