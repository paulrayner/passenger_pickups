Given /^the following arrivals?:$/ do |arrivals_table|
  arrivals = arrivals_table.hashes
  arrivals.each do |arrival|
    Arrival.create(
        :passenger_name => arrival["Name"],
        :flight_number => arrival["Flight"],
        :from => arrival["From"],
        :arrival_time => relative_date(arrival["Date"], arrival["Time"])
    )
  end
end

Given /^the following arrivals?:$/ do |arrivals_table|
  Arrival.delete_all
  arrivals = arrivals_table.hashes
  arrivals.each do |arrival|
    if arrival["Date"] == "today"
      arrival_time = DateTime.parse(arrival["Time"])
    elsif arrival["Date"] == "tomorrow"
      arrival_time = DateTime.parse(arrival["Time"]) + 1.day
    else
      arrival_time = DateTime.parse("#{arrival["Date"]} #{arrival["Time"]}")
    end
    
    @last_arrival_created = Arrival.new(
        :passenger_name => arrival["Name"],
        :flight_number => arrival["Flight"],
        :from => arrival["From"],
        :arrival_time => arrival_time
    )
    @last_arrival_created.save!
  end
end

Given /^there are no arrivals$/ do
  Arrival.delete_all
end

When /^I create an arrival with:$/ do |table|
  arrival_attributes = table.rows_hash
  visit '/arrivals/new'
  fill_in 'Name:', :with => arrival_attributes["Name"]
  fill_in 'Flight #:', :with => arrival_attributes["Flight"]
  fill_in 'From:', :with => arrival_attributes["From"]
  arrival_time = DateTime.parse "#{arrival_attributes["Date"]} #{arrival_attributes["Time"]}"
  select arrival_time.year.to_s, :from => 'arrival_arrival_time_1i'
  select arrival_time.strftime("%B"), :from => 'arrival_arrival_time_2i'
  select arrival_time.day.to_s, :from => 'arrival_arrival_time_3i'
  select arrival_time.hour.to_s, :from => 'arrival_arrival_time_4i'
  select arrival_time.min.to_s, :from => 'arrival_arrival_time_5i'
  click_button 'Create Arrival'
end

Then /^there should be (\d+) arrival with:$/ do |expected_arrivals_count, expected_arrivals_table|
  Arrival.count.should == expected_arrivals_count.to_i
  arrivals = Arrival.all
  actual_arrivals_table = arrivals.map do |arr|
    {
        "Name" => arr.passenger_name,
        "Flight" => arr.flight_number,
        "From" => arr.from,
        "Date" => "#{arr.arrival_time.month}/#{arr.arrival_time.day}/#{arr.arrival_time.year}",
        "Time" => arr.arrival_time.to_s(:pretty_time).strip
    }
  end
  expected_arrivals_table.diff!(actual_arrivals_table)
end

When /^I modify the arrival with:$/ do |table|
  arrival_attributes = table.rows_hash
  visit edit_arrival_path(@last_arrival_created)
  fill_in 'Name:', :with => arrival_attributes["Name"] if arrival_attributes.has_key?('Name')
  fill_in 'Flight #:', :with => arrival_attributes["Flight"] if arrival_attributes.has_key?('Flight')
  fill_in 'From:', :with => arrival_attributes["From"] if arrival_attributes.has_key?('From')
  if arrival_attributes.has_key?('Date')
    arrival_time = DateTime.parse arrival_attributes["Date"]
    select arrival_time.year.to_s, :from => 'arrival_arrival_time_1i'
    select arrival_time.strftime("%B"), :from => 'arrival_arrival_time_2i'
    select arrival_time.day.to_s, :from => 'arrival_arrival_time_3i'
  end
  if arrival_attributes.has_key?('Time')
    arrival_time = DateTime.parse arrival_attributes["Time"]
    select arrival_time.hour.to_s, :from => 'arrival_arrival_time_4i'
    select arrival_time.min.to_s, :from => 'arrival_arrival_time_5i'
  end
  click_button 'Update Arrival'
end