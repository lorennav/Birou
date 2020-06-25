require "faker"
require "open-uri"
# # Offices
#   t.string "name"
#   t.string "address"
#   t.text "description"
#   t.integer "price"
#   t.string "photo"

# # Bookings
#  t.datetime "start_date"
#  t.datetime "end_date"
#  t.bigint "office_id", null: false
#  t.bigint "user_id"
#  t.string "category"

# 100.times do
#   post = Post.new(title: Faker::Coffee.blend_name,
#   url: Faker::Internet.url, votes: rand(0..50))
#   post.save
# end

Booking.destroy_all
Office.destroy_all
# User.destroy_all

puts "creating users"
20.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email , password: "123456")
end

puts "creating offices"
office_names = ["Cowork", "Office", "Space"]
addresses = ["Lisbon, Portugal", "Porto, Portugal", "Vila Real, Portugal", "Viseu, Portugal", "Barcelona, Spain", "Valencia, Spain", "Madrid, Spain"]
10.times do
  office_address = addresses.sample
  office_name = "#{office_names.sample} in #{office_address}"

  office = Office.new(name: office_name, address: office_address, description: Faker::Lorem.sentence(word_count: 10), price: rand(100..10000), owner: User.all.sample)

  file = URI.open('https://source.unsplash.com/featured/?cowork')
  office.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

  puts "creating #{office.name}"
  office.save
end

################ Can you please add this also ####################
##### If you agree. The map will show Romania also.
office = Office.new(name: "Office Space Darius", address: "Arad, Zimandu-Nou", description: "Only the most gracious office-cave.", price: 1999, owner: User.all.sample)

file = URI.open('https://i.pinimg.com/originals/2c/e0/eb/2ce0eb3fa4ae5226ec7534a1a8d4b44c.jpg')
office.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts "Creating #{office.name}"
office.save

###################################################

category = ["Visit", "Rent"]
puts "creating bookings"
100.times do
  office = Office.all.sample
  user = User.all.reject { |u| u == office.owner }
  start_date = Time.now + rand(1..10)
  duration = rand(1..30)
  end_date = start_date + duration

  booking = Booking.new(start_date: start_date, end_date: end_date, office: office, user: user.sample, category: category.sample)
  puts "#{booking.user.name} has booked #{booking.office.name}"
  booking.save
end

puts "finished"
