class ChangeArrivalTimeToDateTime < ActiveRecord::Migration
  def self.up
    change_column :arrivals, :arrival_time, :datetime
  end

  def self.down
    change_column :arrivals, :arrival_time, :time
  end
end
