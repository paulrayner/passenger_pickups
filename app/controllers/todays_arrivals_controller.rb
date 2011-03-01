class TodaysArrivalsController < ApplicationController
  def index
    @arrivals = Arrival.where(:arrival_time => DateTime.parse("00:00")..DateTime.parse("23:59"))
  end
end
