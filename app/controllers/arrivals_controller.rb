class ArrivalsController < ApplicationController
  def new
    @arrival = Arrival.new
  end

  def create
    @arrival = Arrival.new(params[:arrival])

    if @arrival.save
      redirect_to arrival_url(@arrival), :notice => "Arrival created!"
    else
      render :action => "new"
    end
  end

  def show

  end
end
