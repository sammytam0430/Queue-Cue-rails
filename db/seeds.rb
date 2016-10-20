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

5.times do |i|
  Restaurant.create(name: " Restaurant ##{i}", food_type: "Sushi", location: "Vancouver")
end

5.times do |i|
  Restaurant.create(name: " Cafe ##{i}", food_type: "Korean", location: "Vancouver")
end

5.times do |i|
  Restaurant.create(name: " BBQ ##{i}", food_type: "Chinese", location: "Burnaby")
end

5.times do |i|
  Restaurant.create(name: " Hotpot ##{i}", food_type: "Asian", location: "Richmond")
end

puts "Done!"
