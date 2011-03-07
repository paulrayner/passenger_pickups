class FlightsController < ApplicationController
  respond_to :xml

  def index
    respond_with Flight.all
  end
  
  def show
    respond_with(@flight = Flight.find(params[:id]))
  end

  def new
    respond_with(@flight = Flight.new)
  end

  def create
    respond_with(@flight = Flight.create(params[:flight]))
  end

  def edit
    respond_with(@flight = Flight.find(params[:id]))
  end

  def update
    @flight = Flight.find(params[:id])
    @flight.update_attributes(params[:flight])
    respond_with(@flight)
  end
  
  def status
    @flight = Flight.where(
            :flight_number => params["flight_number"],
            :scheduled_time => DateTime.parse("#{params['scheduled_date']} 00:00")..DateTime.parse("#{params['scheduled_date']} 23:59"),
            :from => params["from"]
    ).first

    if @flight
      respond_with @flight
    else
      render :xml => "<errors><error>No matching flight record found</error></errors>", :status => :not_found
    end
  end

  def delete_all
    Flight.delete_all
    respond_with Flight.all
  end

  def delay
    @flight = Flight.find(params[:id])
    @flight.status = 'Delayed'
    @flight.current_time = params[:new_arrival_time]
    @flight.save
    respond_with(@flight)
  end
end
