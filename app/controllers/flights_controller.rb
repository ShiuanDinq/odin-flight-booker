class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map{ |airport| [airport.code, airport.id]}
    @date_options = Flight.select(:start_date).distinct.map{ |date| [date.start_date.strftime("%d/%m/%Y") , date.start_date]}

    unless flight_params.empty?
      if params[:from_airport_id].blank?
        flash.now[:alert] = "Departure airport is missing"
      elsif params[:to_airport_id].blank?
        flash.now[:alert] = "Destination airport is missing"
      elsif params[:passenger_count].blank?
        flash.now[:alert] = "Please choose the number of passengers"
      elsif params[:from_airport_id] == params[:to_airport_id]
        flash.now[:alert] = "Please check your input"   
      else
        @available_flights = Flight.where(flight_params) unless flight_params.empty?
      end
    end
  end

  private
  def flight_params
    params.permit(:start_date, :from_airport_id, :to_airport_id)
  end


end
