class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.date :start_date
      t.time :start_time
      t.integer :flight_duration

      t.timestamps
    end
  end
end
