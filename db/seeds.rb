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

charlotte = User.new(
  first_name: 'Charlotte',
  last_name: 'Margus',
  email: 'charlotte@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

rayan = User.new(
  first_name: 'Rayan',
  last_name: 'Castro',
  email: 'rayan@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

tarig = User.new(
  first_name: 'Tarig',
  last_name: 'Bouazzati',
  email: 'tarig@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

nadda.save!
karem.save!
nima.save!
charlotte.save!
rayan.save!
tarig.save!

users = [karem, nadda, nima, charlotte, rayan, tarig]


places = []
place_urls = [
  'https://homeinner.com/wp-content/uploads/2010/04/Modern-4-bhk-Kerala-Home-Design-by-Shameem-730x487-1-1.jpg',
  'http://i.ytimg.com/vi/rrlxP5rmHxI/hqdefault.jpg',
  'http://www.keralahouseplanner.com/wp-content/uploads/2011/08/beautiful-home-elevation-01.jpg',
  'https://hometone.com/wp-content/uploads/2012/07/beautiful_home_bxav2.jpg',
  'https://data.whicdn.com/images/67394055/original.jpg',
  'https://i.ytimg.com/vi/QV__0XWGQuU/maxresdefault.jpg',
]

6.times do
  place = Place.new(
    full_address: Faker::Address.full_address,
    description: Faker::Lorem.sentence,
    title: Faker::FunnyName.three_word_name,
    price: rand(100..500),
    photo_url: place_urls.shuffle!.shift,
    capacity: rand(1..5),
    user: users.shuffle!.shift,
  )

  place.save!
  places << place
end

seconds_per_day = 24 * 60 * 60
species = %w[rabbit dog cat parrot snake]
pet_urls = [
  'https://exoticanimalsupplies.com/wp-content/uploads/2017/02/pet-rabbit.jpg',
  'https://www.desicomments.com/wp-content/uploads/2017/01/Beautiful-Pet-Image.jpg',
  'https://lisawestphotos.com/wp-content/uploads/2017/10/pittsburgh-pet-photographer-tonkinese-cat-3.jpg'
]


3.times do
  first_day = Time.now + rand(1..10) * seconds_per_day
  last_day = first_day + rand(1..5) * seconds_per_day

  Booking.create(
    booking_start_date: first_day,
    booking_end_date: last_day,
    confirmed: false,
    pet_description: Faker::Lorem.sentence,
    species: species.shift,
    place: places.shuffle!.shift,
    pet_photo_url: pet_urls.shift,
    user: users.shuffle!.shift
  )
end

