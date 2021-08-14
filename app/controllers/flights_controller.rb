class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map{ |airport| [airport.code, airport.id]}
    @date_options = Flight.select(:start_date).distinct.map{ |date| [date.start_date , date.start_date]}
    @available_flights = Flight.where(flight_params) unless flight_params.empty?
  end

  def show
    @flight = Flight.find(params[:id])
  end 

  private
  def flight_params
    params.permit(:start_date, :from_airport_id, :to_airport_id)
  end


end
