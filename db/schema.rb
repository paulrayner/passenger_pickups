# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110304213312) do

  create_table "arrivals", :force => true do |t|
    t.string   "passenger_name"
    t.string   "flight_number"
    t.string   "from"
    t.datetime "arrival_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", :force => true do |t|
    t.string   "flight_number"
    t.string   "from"
    t.datetime "scheduled_time"
    t.datetime "current_time"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
