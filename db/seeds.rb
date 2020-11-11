# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'cleaning old records...'

Booking.destroy_all
Place.destroy_all
User.destroy_all

puts 'creating users with custom avatars uploaded to cloudinary (takes time)...'

nada = User.new(
  first_name: 'Nada',
  last_name: 'Lakkis',
  email: 'nada@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

nada.avatar.attach(io: File.open('app/assets/images/avatars/1.png'),
                   filename: '1.png', content_type: 'image/png')

karem = User.new(
  first_name: 'Karem',
  last_name: 'Mohammed',
  email: 'karem@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

karem.avatar.attach(io: File.open('app/assets/images/avatars/2.png'),
                    filename: '2.png', content_type: 'image/png')

nima = User.new(
  first_name: 'Nima',
  last_name: 'Az',
  email: 'nima@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

nima.avatar.attach(io: File.open('app/assets/images/avatars/3.png'),
                   filename: '3.png', content_type: 'image/png')

charlotte = User.new(
  first_name: 'Charlotte',
  last_name: 'Margus',
  email: 'charlotte@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

charlotte.avatar.attach(io: File.open('app/assets/images/avatars/4.png'),
                        filename: '4.png', content_type: 'image/png')

rayan = User.new(
  first_name: 'Rayan',
  last_name: 'Castro',
  email: 'rayan@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

rayan.avatar.attach(io: File.open('app/assets/images/avatars/5.png'),
                    filename: '5.png', content_type: 'image/png')

tarig = User.new(
  first_name: 'Tarig',
  last_name: 'Bouazzati',
  email: 'tarig@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

tarig.avatar.attach(io: File.open('app/assets/images/avatars/6.png'),
                    filename: '6.png', content_type: 'image/png')

nada.save!
karem.save!
nima.save!
charlotte.save!
rayan.save!
tarig.save!

users = [karem, nada, nima, charlotte, rayan, tarig]

print 'please be patient'

19.times do |i|
  print '.'

  avatar_path = "app/assets/images/avatars/#{6 + i}.png"
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name.downcase}#{i}@gmail.com"

  user = User.new(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: '123456',
    password_confirmation: '123456'
  )

  user.avatar.attach(io: File.open(avatar_path),
                    filename: "#{6 + i}.png",
                    content_type: 'image/png')
  user.save!
  users << user
end

puts ''

puts 'creating and saving places...'

places = []
place_urls = [
  'https://homeinner.com/wp-content/uploads/2010/04/Modern-4-bhk-Kerala-Home-Design-by-Shameem-730x487-1-1.jpg',
  'http://i.ytimg.com/vi/rrlxP5rmHxI/hqdefault.jpg',
  'http://www.keralahouseplanner.com/wp-content/uploads/2011/08/beautiful-home-elevation-01.jpg',
  'https://hometone.com/wp-content/uploads/2012/07/beautiful_home_bxav2.jpg',
  'https://data.whicdn.com/images/67394055/original.jpg',
  'https://i.ytimg.com/vi/QV__0XWGQuU/maxresdefault.jpg',
  'http://www.treesranch.com/dimension/1280x720/upload/2016/04/29/interior-of-old-country-homes-country-style-homes-interior-lrg-685344afb90cd27d.jpg',
  'https://cdn.decoist.com/wp-content/uploads/2014/01/French-country-interior.jpg',
  'http://3.bp.blogspot.com/-7dKGjG6eRlE/VT8QLbD9d8I/AAAAAAAAG8o/T7nk4aNU_bQ/s1600/American%2BHouse%2Binterior%2B2015.jpg',
  'https://www.homeguide.com.sg/wp-content/uploads/2019/07/French-Country-Interior-Design-Ideas-For-Your-Singapore-Home.jpg',
  'https://www.achomes.com/wp-content/uploads/2014/10/hill-country-ach-interior-design.png',
  'https://decoholic.org/wp-content/uploads/2013/11/country-house-by-alex-scott-porter-design-interiors.jpg',
  'http://cdn.home-designing.com/wp-content/uploads/2013/03/formal-dining-french-country-interiors-busts-and-art.jpeg',
  'http://3.bp.blogspot.com/-l__pQ9V-vJg/UO7zBObmcdI/AAAAAAAADS4/1UjMl9ZDyC8/s640/Jonathan-Adlers-Dog-LiberaceDog-Swing-Interior-Design-Hound.png',
  'https://www.avso.org/wp-content/uploads/files/8/3/3/cool-caravans-for-pets-designer-dog-house-on-wheels-0-833.jpg',
  'https://sevendimensions.in/wp-content/uploads/2018/10/Home-Interiors.jpg',
  'https://mymodernmet.com/wp/wp-content/uploads/2018/01/minimalist-cat-furniture-rinn-1.jpg',
  'http://cdn.home-designing.com/wp-content/uploads/2013/07/cat-house-5.jpg',
  'https://blog.dcorstore.com/wp-content/uploads/2018/09/NONAGON-style-n9s-KAY-Architecture-Chans-House-pet-friendly-cat-yellow-gray-wood-sleek-minimalist-contemporary-modern-feline-open-plan-living-room-sofa-modular-Totoro.jpg',
  'https://nonagon.style/wp-content/uploads/2018/02/NONAGON-style-n9s-international-cat-day-home-tour-feline-kitty-Egue-y-Seta-Gailas-Apartment-Piso-Gaila-cat-on-bed-interior-design-bedroom-blue-white-neutral-palette.jpg',
  'https://thumbs.dreamstime.com/b/dog-house-interior-dog-house-interior-lying-soft-grey-carpet-next-to-large-sofa-elegant-abstract-painting-101303258.jpg',
  'https://cdn.decorilla.com/online-decorating/wp-content/uploads/2014/07/pet-friendly-interior-design-9.jpg',
  'https://www.thesprucepets.com/thmb/RcyjGGETtn8C1bk-lV37TAQC-3A=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-655307584-5c76f13546e0fb0001edc770.jpg',
  'https://nextluxury.com/wp-content/uploads/dog-room-with-washing-station.jpeg',
  'https://designyoutrust.com/wp-content/uploads/2018/09/modern-dog-house-wood-green-roof-040918-1255-01.jpg'
]

25.times do
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

# seconds_per_day = 24 * 60 * 60
# users = [karem, nada, nima, charlotte, rayan, tarig]
# species = %w[rabbit dog cat parrot snake]
# pet_urls = [
#   'https://exoticanimalsupplies.com/wp-content/uploads/2017/02/pet-rabbit.jpg',
#   'https://www.desicomments.com/wp-content/uploads/2017/01/Beautiful-Pet-Image.jpg',
#   'https://lisawestphotos.com/wp-content/uploads/2017/10/pittsburgh-pet-photographer-tonkinese-cat-3.jpg'
# ]


# 3.times do
#   first_day = Time.now + rand(1..10) * seconds_per_day
#   last_day = first_day + rand(1..5) * seconds_per_day
#   user = users.shift

#   Booking.create(
#     booking_start_date: first_day,
#     booking_end_date: last_day,
#     confirmed: false,
#     pet_description: Faker::Lorem.sentence,
#     species: species.shift,
#     place: places.shuffle!.shift,
#     pet_photo_url: pet_urls.shift,
#     user: user
#   )
# end

puts 'all done...'
