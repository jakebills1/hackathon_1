class AddressesController < ApplicationController
  
    before_action :set_location
    before_action :set_address, only: [:show, :edit, :update, :destroy]
  
    def index
      @addresses = @location.addresses.all
    end
  
    def show
      
    end
  
    def new
      @address = Address.new()
      render partial: "form"
    end
  
    def create
      @address = Address.new(
        street_address: params[:street_address],
        location_id: @location.id,
      )
      if @address.save
        redirect_to trip_path(@location.trip.id)
      else
        render :new
      end
    end
  
    def edit
      render partial: "form"
    end
  
    def update
      if @address.update(address_params)
        redirect_to trip_path(@location.trip.id)
      else
        render :edit
      end
    end
  
    def destroy
      @address.destroy
      redirect_to @trip
    end
  
    private
      def address_params
        params.require(:address).permit(:street_address)
      end
  
      def set_address
        @address = Address.find(params[:id])
      end
  
      def set_location
        @location = Location.find(params[:location_id])
      end
  end
  
  
