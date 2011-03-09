class FlightStatus < ActiveResource::Base
  self.site = (::Rails.env == 'production') ? "http://passenger-pickups.heroku.com/" : "http://localhost:3000"
  self.element_name = "flight"
  self.user = 'flight_status'
  self.password = '2eekX8Vx'

  def delay(new_arrival_time)
    put(:delay, :new_arrival_time => new_arrival_time)
  end

  class << self
    def delete_all
      self.delete(:delete_all)
    end

    def status(scheduled_date, flight_number, from)
      self.find(:one, :from => :status, :params => {:scheduled_date => scheduled_date, :flight_number => flight_number, :from => from})
    end
  end
end