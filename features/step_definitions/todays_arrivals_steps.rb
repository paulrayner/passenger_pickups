Given /^the following arrivals?:$/ do |arrivals_table|
  arrivals = arrivals_table.hashes
  arrivals.each do |arrival|
    Arrival.create!(
        :passenger_name => arrival["Name"],
        :flight_number  => arrival["Flight"],
        :from           => arrival["From"],
        :arrival_time   => arrival["Time"]
    )
  end
end

When /^I view today's arrivals$/ do
  visit "/"
end

Then /^I should see the following:$/ do |expected_arrivals|
  actual_arrivals = tableish('table#todays_arrivals tr', 'td,th')
  expected_arrivals.diff!(actual_arrivals)
end
