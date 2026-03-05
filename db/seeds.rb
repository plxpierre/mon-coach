# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning DB"
User.destroy_all


puts "Creating user"

User.create!(email: "aude@gmail.com", password: "123456", username: "Aude", weight: 55, height: 163, age: 23, gender: "Woman")
User.create!(email: "nicolas@gmail.com", password: "123456", username: "Nicolas", weight: 65, height: 174, age: 33, gender: "Man")
User.create!(email: "pierre@gmail.com", password: "123456", username: "Pierre", weight: 77, height: 185, age: 29, gender: "Man")
User.create!(email: "test@test.fr", password: "password", username: "Pierre", weight: 77, height: 185, age: 29, gender: "Man")
User.create!(email: "oldman@test.fr", password: "password", username: "Pierre", weight: 77, height: 185, age: 95, gender: "Man")


puts "Crating complete"
