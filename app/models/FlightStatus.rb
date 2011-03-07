class FlightStatus < ActiveResource::Base
  self.site = "http://localhost:3000"
  self.element_name = "flight"

  def delay(new_arrival_time)
    put(:delay, :new_arrival_time => new_arrival_time)
  end

  class << self
    def delete_all
      self.delete(:delete_all)
    end
  end
end