# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
puts "Delete all cars"
Car.delete_all
puts "creating user..."


puts "Creating cars..."
10.times do
  Car.create(model: Faker::Vehicle.model,
  price: 100,
  seat_number: rand(2..8),
  user_id: 1)
end
puts "Finished!"
