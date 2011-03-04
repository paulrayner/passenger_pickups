class FlightsController < ApplicationController
  def index
    render :xml => Flight.all
  end

  def show

#    render :json => Flight.where(:flight_number => params["flight_number"], :scheduled_time => )
  end
end
