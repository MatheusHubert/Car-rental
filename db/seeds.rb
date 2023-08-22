# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

require 'faker'
puts "Delete all cars"
Car.delete_all
puts "creating user..."

puts "Creating cars..."
10.times do
  car = Car.new(
    model: Faker::Vehicle.model,
    price: 100,
    seat_number: rand(2..8),
    user_id: 1
  )
  file = URI.open("https://carwow-uk-wp-3.imgix.net/18015-MC20BluInfinito-scaled-e1666008987698.jpg")
  car.photos.attach(io: file, filename: "car.png", content_type: "image/png")
  car.save
end
puts "Finished!"
