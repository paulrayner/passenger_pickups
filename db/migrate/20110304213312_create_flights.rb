class CreateFlights < ActiveRecord::Migration
  def self.up
    create_table :flights do |t|
      t.string :flight_number
      t.string :from
      t.datetime :scheduled_time
      t.datetime :current_time
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :flights
  end
end
