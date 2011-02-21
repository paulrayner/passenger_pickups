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

  def edit
    @arrival = Arrival.find(params[:id])
  end

  def update
    @arrival = Arrival.find(params[:id])

    if @arrival.update_attributes(params[:arrival])
      redirect_to arrival_url(@arrival), :notice => "Arrival updated!"
    else
      render :action => "edit"
    end
  end
end
