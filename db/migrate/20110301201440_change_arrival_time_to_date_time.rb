class ChangeArrivalTimeToDateTime < ActiveRecord::Migration
  def self.up
    remove_column :arrivals, :arrival_time
    add_column :arrivals, :arrival_time, :datetime
  end

  def self.down
    remove_column :arrivals, :arrival_time
    add_column :arrivals, :arrival_time, :time
  end
end
