class FlightStatus < ActiveResource::Base
  self.site = "http://localhost:3000"
  self.element_name = "flight"
end