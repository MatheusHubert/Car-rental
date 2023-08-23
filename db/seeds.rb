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
  urls = [
    "https://pictures.dealer.com/n/newportautocenterbentley/0107/bc4ad99ad8cd7bfd846a67c11e00f186x.jpg",
    "https://w0.peakpx.com/wallpaper/871/187/HD-wallpaper-bentley-continental-gt-exterior-front-view-matte-black-coupe-tuning-continental-gt-matte-black-continental-gt-luxury-cars-british-cars-bentley.jpg",
    "https://f7432d8eadcf865aa9d9-9c672a3a4ecaaacdf2fee3b3e6fd2716.ssl.cf3.rackcdn.com/C2299/U1399/IMG_86788-large.jpg",
    "https://carsguide-res.cloudinary.com/image/upload/f_auto%2Cfl_lossy%2Cq_auto%2Ct_default/v1/editorial/bentley-continental-gt-v8s-concourse-series-black-edition.jpg",
    "https://ag-spots-2021.o.auroraobjects.eu/2021/06/19/bentley-continental-gtc-v8-s-2016-black-edition-c497219062021183724_1.jpg"
  ]
  urls.each do |url|
    file = URI.open(url)
    car.photos.attach(io: file, filename: "car.png", content_type: "image/png")
    car.save
  end
end
puts "Finished!"
