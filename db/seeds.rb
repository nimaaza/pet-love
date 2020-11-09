# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Place.destroy_all
User.destroy_all

nadda = User.new(
  first_name: 'Nada',
  last_name: 'Lakkis',
  email: 'nada@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

karem = User.new(
  first_name: 'Karem',
  last_name: 'Mohammed',
  email: 'karem@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

nima = User.new(
  first_name: 'Nima',
  last_name: 'Az',
  email: 'nima@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

nadda.save!
karem.save!
nima.save!

users = [nadda, karem, nima]


places = []

10.times do
  place = Place.new(
    full_address: Faker::Address.full_address,
    description: Faker::Lorem.sentence,
    title: Faker::FunnyName.three_word_name,
    price: rand(100..500),
    photo_url: 'https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/greece.jpg',
    capacity: rand(1..5),
    user: users.sample,
  )

  place.save!
  places << place
end

seconds_per_day = 24 * 60 * 60
species = %w[cat dog parrot rabbit snake]

3.times do
  first_day = Time.now + rand(1..10) * seconds_per_day
  last_day = first_day + rand(1..5) * seconds_per_day

  Booking.create(
    booking_start_date: first_day,
    booking_end_date: last_day,
    confirmed: false,
    pet_description: Faker::Lorem.sentence,
    species: species.sample,
    place: places.shuffle!.shift,
    user: users.first,
  )
end

