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

flights = Flight.create([
  { start_datetime: '2020-10-22, 10:10:00', flight_duration: 1, from_airport_id: airports[1].id, to_airport_id:airports[9].id },
  { start_datetime: '2020-06-15, 20:20:00', flight_duration: 1.5, from_airport_id: airports[2].id, to_airport_id:airports[8].id },
  { start_datetime: '2020-07-07, 10:10:00', flight_duration: 1, from_airport_id: airports[3].id, to_airport_id:airports[8].id },
  { start_datetime: '2020-09-19, 20:20:00', flight_duration: 1.5, from_airport_id: airports[4].id, to_airport_id:airports[7].id },
  { start_datetime: '2020-10-27, 10:10:00', flight_duration: 1, from_airport_id: airports[5].id, to_airport_id:airports[6].id },
  { start_datetime: '2020-10-17, 20:20:00', flight_duration: 1.5, from_airport_id: airports[6].id, to_airport_id:airports[5].id },
  { start_datetime: '2020-12-15, 10:10:00', flight_duration: 1, from_airport_id: airports[7].id, to_airport_id:airports[4].id },
  { start_datetime: '2020-11-12, 20:20:00', flight_duration: 1.5, from_airport_id: airports[8].id, to_airport_id:airports[3].id },
  { start_datetime: '2020-01-22, 10:10:00', flight_duration: 1, from_airport_id: airports[9].id, to_airport_id:airports[2].id },
  { start_datetime: '2020-05-02, 20:20:00', flight_duration: 1.5, from_airport_id: airports[0].id, to_airport_id:airports[1].id },
])

