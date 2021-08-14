# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport::delete_all
Flight::delete_all

airports = Airport.create([
  { name: 'Atlanta', code: 'ATL'}, 
  { name: 'Dallas & Ft. Worth', code: 'DFW'}, 
  { name: 'Denver', code: 'DEN'}, 
  { name: 'Charlotte', code: 'CLT'},
  { name: 'Chicago', code: 'ORD'}, 
  { name: 'Los Angeles', code: 'LAX'}, 
  { name: 'Phoenix', code: 'PHX'}, 
  { name: 'Orlando', code: 'MCO'}, 
  { name: 'Seattle', code: 'SEA'},
  { name: 'Las Vegas', code: 'LAS'}
])

flight_durations = [1, 1.5, 2, 2.5]

start_dates = [
  '2020-10-01',
  '2020-10-02',
  '2020-10-03',
  '2020-10-04',
  '2020-10-05',
  '2020-10-06',
  '2020-10-07',
  '2020-10-08',
  '2020-10-09',
  '2020-10-10',
]

start_times = [
  '09:00:00',
  '12:00:00',
  '18:00:00',
]

airports.each do |from_airport|
  airports.each do |to_airport|
    start_dates.each do |date|
      start_times.each do |time|
        next if from_airport == to_airport
        Flight.create(start_date: date, start_time: time, flight_duration: flight_durations.sample, from_airport_id: from_airport.id, to_airport_id: to_airport.id )
      end
    end
  end
end


