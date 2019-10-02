# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

orgs = Organization.create(
  [
    { name: "Bob's Burgers", rate: 10 },
    { name: "Moe's Tavern", rate: 12 },
    { name: "Sally's Sandwiches", rate: 13 }
  ]
)
