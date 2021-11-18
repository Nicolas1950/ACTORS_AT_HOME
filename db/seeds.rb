# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'json'

Actor.destroy_all
User.destroy_all
puts "Database cleaned"

nicolas = User.create(email: "nicolas@hotmail.com", password: "123456")
adonis = Actor.create(
      name: Faker::Artist.name,
      price: Faker::Number.number,
      field: "Comedy",
      address: "Tour Eiffel",
      user: nicolas
    )

url = "https://raw.githubusercontent.com/EthanRBrown/rrad/master/addresses-us-100.json"
json = JSON.parse(URI.open(url).read)
result = json["addresses"]
result.each do |hash|
  address = "#{hash["address1"]}, #{hash["city"]}"
  actor = Actor.create!(
    name: Faker::Artist.name,
    price: Faker::Number.number,
    field: "Comedy",
    address: address,
    user: nicolas
  )
  p actor
end

puts "Actors and users created"
