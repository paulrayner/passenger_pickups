Given /^the following flights? in the flight status system:$/ do |flight_details_table|
  FlightStatus.delete_all
  flight_details_table.hashes.each do |flight_details_row|
    scheduled_time = "#{relative_date(flight_details_row["Scheduled Date"])} #{flight_details_row["Scheduled Time"]}"
    status = flight_details_row["Status"] || 'On Time'
    current_time = (status == 'On Time') ? scheduled_time : "#{relative_date(flight_details_row["Current Date"])} #{flight_details_row["Current Time"]}"
    FlightStatus.create(
            :flight_number => flight_details_row["Flight Number"],
            :from => flight_details_row["From"],
            :scheduled_time => scheduled_time,
            :current_time => current_time,
            :status => status
    )
  end
end

Given /^the arrival time for (yesterday|today|tomorrow)'s flight ([A-Z\d]{2} \d+) from ([A-Z]{3}) has been delayed to (.*)$/ do |flight_day, flight_number, from, new_arrival_time|
  flight_date = relative_date(flight_day)
  @flight = FlightStatus.find(:one, :from => :status, :params => {:scheduled_date => flight_date, :flight_number => flight_number, :from => from})
  @flight.delay(:new_arrival_time => DateTime.parse("#{flight_date} #{new_arrival_time}"))
end

When /^I request status for all flights$/ do
  @flights = FlightStatus.all
end

Then /^I should receive status for (\d+) flights$/ do |expected_flight_count|
  @flights.count.should == expected_flight_count.to_i
end


When /^I request status for (yesterday|today|tomorrow)'s flight ([A-Z\d]{2} \d+) from ([A-Z]{3})$/ do |flight_day, flight_number, from|
  flight_date = relative_date(flight_day)
  @flight = FlightStatus.find(:one, :from => :status, :params => {:scheduled_date => flight_date, :flight_number => flight_number, :from => from})
end

Then /^I should receive the following flight details$/ do |expected_flight_details_table|
  expected_flight_details = expected_flight_details_table.rows_hash
  @flight.flight_number.should == expected_flight_details["Flight Number"]
  @flight.from.should == expected_flight_details["From"]
  @flight.scheduled_time.should == DateTime.parse("#{relative_date(expected_flight_details["Scheduled Date"])} #{expected_flight_details["Scheduled Time"]}")
  @flight.current_time.should == DateTime.parse("#{relative_date(expected_flight_details["Current Date"])} #{expected_flight_details["Current Time"]}")
  @flight.status.should == expected_flight_details["Status"]
end
