class Arrival < ActiveRecord::Base
  def flight_status
    @flight_status || check_flight_status
  end

  def check_flight_status
    @flight_status = FlightStatus.status(Date.parse(self.arrival_time.to_s), self.flight_number, self.from)
  end

  def flight_status_available?
    !flight_status.nil?
  end
end
