class LocationsController < ApplicationController
  before_action :set_trip, except: [:new]
  before_action :set_location, only:[:update, :destroy]

  def index
  end

  def show
  end

  def new
<<<<<<< HEAD
    @location = Location.new
    # @trip = Trip.find(params[:id])
=======
    render partial: "form"
>>>>>>> origin/master
  end

  def create
    @location = @trip.locations.new(location_params)

    if @location.save
      redirect_to @trip
    else
      render partial: "form"
    end
  end

  def edit
  end

  def update
    if @location.save
      redirect_to @trip
    else
      render partial: "form"
    end
  end

  def destroy
    @location.destroy
    redirect_to @trip
  end

  private
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:city, :state, :country, :trip_id)
    end
end
