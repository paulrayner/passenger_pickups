class Arrival < ActiveRecord::Base
  def flight_status
    #@flight_status ||= get_flight_status rescue nil
    get_flight_status
  end

  def get_flight_status
    Flight.status(Date.parse(self.arrival_time.to_s), self.flight_number, self.from)
  end
end
