Given /^the following flights:$/ do |flight_details_table|
  Flight.delete_all
  flight_details_table.hashes.each do |flight_details_row|
    Flight.create(
            :flight_number => flight_details_row["Flight Number"],
            :from => flight_details_row["From"],
            :scheduled_time => "#{relative_date(flight_details_row["Scheduled Date"])} #{flight_details_row["Scheduled Time"]}",
            :current_time => "#{relative_date(flight_details_row["Current Date"])} #{flight_details_row["Current Time"]}",
            :status => flight_details_row["Status"]
    )
  end
end

When /^I request status for (yesterday|today|tomorrow)'s flight ([A-Z\d]{2} \d+) from ([A-Z]{3})$/ do |flight_day, flight_number, from|
  pending # express the regexp above with the code you wish you had
end

Then /^I should receive the following flight details$/ do |expected_flight_details_table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end
