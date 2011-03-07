class FlightStatus < ActiveResource::Base
  self.site = "http://localhost:3000"
  self.element_name = "flight"

  def self.delete_all
    self.delete(:delete_all)
  end
end