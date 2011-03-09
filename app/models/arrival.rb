class Arrival < ActiveRecord::Base
  def flight_status
    @flight_status ||= check_flight_status rescue nil
  end

  def check_flight_status
    Flight.where(
            :flight_number => self.flight_number,
            :scheduled_time => DateTime.parse("#{self.arrival_date} 00:00")..DateTime.parse("#{self.arrival_date} 23:59"),
            :from => self.from
    ).first
  end

  def arrival_date
    self.arrival_time.strftime('%m/%d/%Y')
  end
end
