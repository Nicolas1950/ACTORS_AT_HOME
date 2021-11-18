# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Actor.destroy_all
User.destroy_all
puts "Database cleaned"

nicolas = User.create(email: "nicolas@hotmail.com", password: "123456")

30.times do
  Actor.create!(
      name: Faker::Artist.name,
      price: Faker::Number.number,
      field: "Comedy",
      address: Faker::Address.full_address,
      user: nicolas
    )
end

puts "Actors and users created"
