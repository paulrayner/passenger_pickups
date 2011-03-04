class FlightsController < ApplicationController
  def index
    render :json => Flight.all.as_json
  end

  def show

#    render :json => Flight.where(:flight_number => params["flight_number"], :scheduled_time => )
  end
end
