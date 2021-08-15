class BookingsController < ApplicationController

  def index
    @bookings = Booking.includes(flight: [:from_airport, :to_airport]).all
  end 
  
  def new
    @passenger_count = params[:passenger_count].to_i
    @booking = Booking.new(flight_id: params[:flight_id])
    @passenger_count.times { @booking.passengers.build }
    @flight = Flight.includes(:to_airport, :from_airport).find(params[:flight_id])
  end

  def create
    @booking = Booking.new(booking_params)
 

    if @booking.save
      redirect_to @booking
    else
      flash.now.alert = @booking.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @booking = Booking.includes( :passengers, flight: [:from_airport, :to_airport],).find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
