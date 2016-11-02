# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
raise "Development seeds only (for now)!" unless Rails.env.development?

puts "Destroying Data ..."

Restaurant.destroy_all
Customer.destroy_all
Reservation.destroy_all

puts "Seeding Data ..."

require 'json'
# Importing json data
vancouver = "/vagrant/queue-que-rails/restaurant-data/vancouver.json"
coquitlam = "/vagrant/queue-que-rails/restaurant-data/coquitlam.json"
surrey = "/vagrant/queue-que-rails/restaurant-data/surrey.json"
burnaby = "/vagrant/queue-que-rails/restaurant-data/burnaby.json"
richmond = "/vagrant/queue-que-rails/restaurant-data/richmond.json"
langley = "/vagrant/queue-que-rails/restaurant-data/langley.json"
vanRests = JSON.parse(File.read(vancouver))
langleyRests = JSON.parse(File.read(langley))
burnabyRests = JSON.parse(File.read(burnaby))
surreyRests = JSON.parse(File.read(surrey))
coquitlamRests = JSON.parse(File.read(coquitlam))
richmondRests = JSON.parse(File.read(richmond))

vanRests.each do |r|
  Restaurant.create(
    name: "#{r["name"]}",
    food_type: "#{r["categories"][0]["alias"]}",
    location: "Vancouver"
  )
end

langleyRests.each do |r|
  Restaurant.create(
    name: "#{r["name"]}",
    food_type: "#{r["categories"][0]["alias"]}",
    location: "Langley"
  )
end

burnabyRests.each do |r|
  Restaurant.create(
    name: "#{r["name"]}",
    food_type: "#{r["categories"][0]["alias"]}",
    location: "Burnaby"
  )
end
surreyRests.each do |r|
  Restaurant.create(
    name: "#{r["name"]}",
    food_type: "#{r["categories"][0]["alias"]}",
    location: "Surrey"
  )
end
coquitlamRests.each do |r|
  Restaurant.create(
    name: "#{r["name"]}",
    food_type: "#{r["categories"][0]["alias"]}",
    location: "Coquitlam"
  )
end
richmondRests.each do |r|
  Restaurant.create(
    name: "#{r["name"]}",
    food_type: "#{r["categories"][0]["alias"]}",
    location: "Richmond"
  )
end

puts "Done!"
