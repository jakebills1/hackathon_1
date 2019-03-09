class TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :trip, except: [:index, :new, :create]

  def index
    @trips = current_user.trips
  end

  def show
  end

  def new
    @trip = current_user.trips
  end

  def create
    @trip = current_user.trips.new(trip_params)
    if @trip.save
    redirect_to trips_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
    redirect_to trip_path
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private

    def trip
      @trip = current_user.trips.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:name)
    end
end