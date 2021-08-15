class BookingsController < ApplicationController

  def new
    @passenger_count = params[:passenger_count].to_i
    @booking = Booking.new(flight_id: params[:flight_id])
    @passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
 

    if @booking.save
      redirect_to root_path
    else
      flash.now.alert = @booking.errors.full_messages.to_sentence
      render :new
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
