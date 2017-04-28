# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Tool.destroy_all
User.destroy_all

puts 'Creating users...'
10.times do
  user = User.new(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password!",
    password_confirmation: "password!")
  user.save
end

puts 'Users created!'
puts 'Creating tools...'

tools_attributes = [
  {
    name:         "Circular Saw",
    category:     "Home Improvement",
    location:     "32 Grosse Hamburger Str.",
    city:         "Berlin",
    description:  "In perfect working condition",
    user_id:     1
  },
  {
    name:         "Hammer",
    category:     "Home Improvement",
    location:     "Schillerstraße 7",
    city:         "Berlin",
    description:  "Perfect for hammering nails",
    user_id:     1
  },
  {
    name:         "Leaf Blower",
    category:     "Gardening",
    location:     "Courbierestr. 13",
    description:  "A fine garden leaf blower and vacuum!",
    city:         "Berlin",
    user_id:     2
  },
  {
    name:         "Fence Post Hole Digger",
    category:     "Gardening",
    location:     "Perleberger Str.",
    description:  "Puts your fence up in no time",
    city:         "Berlin",
    user_id:     2
  },
  {
    name:         "Electric Lawn Mower",
    category:     "Gardening",
    location:     "Bluecherstraße 11",
    city:         "Berlin",
    description:  "In mint condition!",
    user_id:     3
  },
  {
    name:         "Jet washer",
    category:     "Automotive",
    location:     "Sonnenallee 192",
    city:         "Berlin",
    description:  "Multi purpose but especially good to clean your car",
    user_id:     3
  },
  {
    name:         "Chassis stands",
    category:     "Automotive",
    location:     "Josef-Orlopp-Straße 18",
    city:         "Berlin",
    description:  "You know what they're for",
    user_id:     4
  },
]
Tool.create!(tools_attributes)
puts 'Tools created!'

puts 'Finished!'
