class CreateArrivals < ActiveRecord::Migration
  def self.up
    create_table :arrivals do |t|
      t.string :passenger_name
      t.string :flight_number
      t.string :from, :length => 3
      t.time :arrival_time
      t.timestamps
    end
  end

  def self.down
    drop_table :arrivals
  end
end
