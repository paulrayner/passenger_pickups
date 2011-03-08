require 'rubygems'
require 'fastercsv'

def relative_date(date_name)
  case date_name
    when "today"
      return Date.today
    when "yesterday"
      return Date.today - 1.day
    when "tomorrow"
      return Date.today + 1.day
    else
      return nil
  end
end

Flight.delete_all

source_path = File.join(File.dirname(__FILE__), 'flights.csv')

FasterCSV.foreach(source_path, { :headers => :first_row, :header_converters => :symbol }) do |row|
  status = row[:status]
  scheduled_time = "#{relative_date(row[:day])} #{row[:scheduled_time]}"
  current_time = scheduled_time

  if status.starts_with?('Now ')
    current_time = "#{relative_date(row[:day])} #{status.from(4)}"
    if current_time > scheduled_time
      status = 'Delayed'
    else
      status = 'On Time'
    end
  end

  if status == 'Canceled'
    current_time = nil
  end

  Flight.create(
          :flight_number => row[:flight],
          :from => row[:from],
          :scheduled_time => scheduled_time,
          :status => status,
          :current_time => current_time
  )
end