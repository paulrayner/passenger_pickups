Given /^there are no arrivals$/ do
  Arrival.delete_all
end

When /^I create an arrival with:$/ do |table|
  arrival_attributes = table.rows_hash
  visit '/arrival/new'
  fill_in 'Name', :with => arrival_attributes["Name"]
  fill_in 'Flight #', :with => arrival_attributes["Flight"]
  fill_in 'From', :with => arrival_attributes["From"]
  fill_in 'Arrival Time', :with => arrival_attributes["Time"]
  submit
end

Then /^there should be (\d+) arrival with:$/ do |expected_arrivals_count, expected_arrivals_table|
  Arrival.count.should == expected_arrivals_count
  arrivals = Arrival.all
  actual_arrivals_table = arrivals.map do |arr|
    {
        "Name" => arr.passenger_name,
        "Flight" => arr.flight_number,
        "From" => arr.from,
        "Time" => arr.arrival_time
    }
  end
  expected_arrivals_table.diff!(actual_arrivals_table)
end