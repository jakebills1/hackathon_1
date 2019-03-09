class LocationsController < ApplicationController
  before_action :set_trip
  before_action :set_location, only:[:edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @location = Location.new
    # @trip = Trip.find(params[:id])
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
    if @location.update(location_params)
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
      params.require(:location).permit(:city, :state, :country)
    end
end
