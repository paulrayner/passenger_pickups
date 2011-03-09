require 'rubygems'
require 'fastercsv'

require File.join(File.dirname(__FILE__), 'lib/helpers')

Flight.delete_all

source_path = File.join(File.dirname(__FILE__), 'flights.csv')
$stdout.print 'Creating flights'
FasterCSV.foreach(source_path, { :headers => :first_row, :header_converters => :symbol }) do |row|
  $stdout.print '.'
  $stdout.flush

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

  if status == 'Arrived' && DateTime.parse(scheduled_time) > DateTime.now
    status = 'On Time'
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
$stdout.print "Done.\n"