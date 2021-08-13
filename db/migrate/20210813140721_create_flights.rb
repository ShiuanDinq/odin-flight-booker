class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.datetime :start_datetime
      t.integer :flight_duration

      t.timestamps
    end
  end
end
