require File.join(File.dirname(__FILE__), 'lib/helpers')

Arrival.delete_all

arrivals = [
        ['Richard Lawrence', 'UA 7588', 'MSP', 'today', '5:42PM'],
        ['Paul Rayner', 'UA 6981', 'TUS', 'today', '3:39PM'],
        ['Bob Hartman', 'UA 427', 'IAD', 'today', '12:58PM'],
        ['Rob Myers', 'WN 12', 'MCI', 'tomorrow', '1:10PM'],
        ['Dave Sharrock', 'CO 601', 'IAH', 'today', '2:33PM']
]

$stdout.print 'Creating arrivals'
arrivals.each do |arrival|
  $stdout.print '.'
  $stdout.flush
  
  Arrival.create(
          :passenger_name => arrival[0],
          :flight_number => arrival[1],
          :from => arrival[2],
          :arrival_time => "#{relative_date(arrival[3])} #{arrival[4]}"
  )
end
$stdout.print "Done.\n"