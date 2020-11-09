# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Place.destroy_all

10.times do
  Place.create(
    full_address: Faker::Address.full_address,
    description: Faker::Lorem.sentence,
    photo_url: 'https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/greece.jpg',
    capacity: rand(1..5),
    user_id: 1,
  )
end
