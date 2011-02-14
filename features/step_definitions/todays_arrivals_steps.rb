When /^I view today's arrivals$/ do
  visit "/"
end

Then /^I should see the following:$/ do |expected_arrivals|
  actual_arrivals = tableish('table#todays_arrivals tr', 'td,th')
  expected_arrivals.diff!(actual_arrivals)
end
