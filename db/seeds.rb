require "faker"
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

# puts "creating users"
# 100.times do
#   User.create(name: Faker::Name.name, email: Faker::Internet.email , password: "123456")
# end

# puts "creating offices"
# office_names = ["Cowork", "Office", "Space"]
# addresses = ["Lisbon", "Porto", "Faro", "Vila Real", "Viseu"]
# 20.times do
#   office_address = addresses.sample
#   office_name = "#{office_names.sample} in #{office_address}"

#   office = Office.new(name: office_name, address: office_address, description: Faker::Lorem.sentence(word_count: 10), price: rand(100..10000), owner: User.all.sample)
#   puts "creating #{office.name}"
#   office.save
# end

# category = ["visit", "rent"]
# puts "creating bookings"
# 100.times do
#   office = Office.all.sample
#   user = User.all.reject { |u| u == office.owner }
#   start_date = Time.now + rand(1..10)
#   duration = rand(1..30)
#   end_date = start_date + duration

#   booking = Booking.new(start_date: start_date, end_date: end_date, office: office, user: user.sample, category: category.sample)
#   puts "#{booking.user.name} has booked #{booking.office.name}"
#   booking.save
# end
# puts "finished"
