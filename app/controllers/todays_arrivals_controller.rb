class TodaysArrivalsController < ApplicationController
  def index
    @arrivals = Arrival.all
  end
end
