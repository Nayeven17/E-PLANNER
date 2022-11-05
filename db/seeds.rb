# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning database'
Booking.destroy_all
Review.destroy_all
Event.destroy_all
User.destroy_all

puts "Destroyed all records"

puts 'Creating users....'

user1 = User.create(email: "john.doe@anywhere.com", password: "123456")
user2 = User.create(email: "jane.doe@anywhere.com", password: "123456")

puts "Created #{User.count} users"

puts 'Creating events....'

events = [
  {
    title: "Summertime Madness",
    description: "Greatest event for the beginning of summer featuring famous local artists!",
    start_date: Date.new(2022, 8, 5),
    end_date: Date.new(2022, 8, 5),
    location: "Grand Baie",
    price: 2_300,
    category: "Festival",
    slot: 100,
    contact: "summertime@madness.com",
    image_url: "https://images.unsplash.com/photo-1468234847176-28606331216a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1477&q=80",
    user_id: user1.id
  },
  {
    title: "Tomorrow Island 2022",
    description: "A unique event for the first time in Mauritius...",
    start_date: Date.new(2022, 11, 6),
    end_date: Date.new(2022, 11, 6),
    location: "Mahebourg",
    price: 1_500,
    category: "Festival",
    slot: 400,
    contact: "tomorrow@island.com",
    image_url: "https://images.unsplash.com/photo-1574155088851-0c770818ba40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    user_id: user2.id
  },
  {
    title: "Sunburn Festival",
    description: "The sun is back, and so is Sunburn! Come and have a great time with friends at Sunburn!",
    start_date: Date.new(2022, 12, 5),
    end_date: Date.new(2022, 12, 5),
    location: "Trou aux Biches",
    price: 1_800,
    category: "Festival",
    slot: 350,
    contact: "sunburn@festival.com",
    image_url: "https://images.unsplash.com/photo-1567942712661-82b9b407abbf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    user_id: user1.id
  }
]

events.each do |event|
  Event.create!(title: event[:title], description: event[:description], start_date: event[:start_date],
                end_date: event[:end_date], location: event[:location], price: event[:price], category: event[:category],
                image_url: event[:image_url], user_id: event[:user_id], slot: event[:slot], contact: event[:contact])
end

puts "Created #{Event.count} events"

# puts 'Creating reviews....'

# reviews = [
#   {
#     comment: "We went to this event last weekend. We had the best time of our life!",
#     rating: 5,
#     booking_id: ,
#     # car_id: Car.all.sample.id,
#     # user_id: user1.id
#   },
#   {
#     comment: "We went to this event last weekend. We had the best time of our life!",
#     rating: 5,
#     booking_id: ,
#     # car_id: Car.all.sample.id,
#     # user_id: user2.id
#   }
# ]

# reviews.each do |review|
#   Review.create!(comment: review[:comment], rating: review[:rating], booking_id: review[:booking_id])
# end

# puts "Created #{Review.count} reviews"

puts 'Creating bookings....'

bookings = [
  {
    event_id: Event.all.sample.id,
    user_id: user1.id
  },
  {
    event_id: Event.all.sample.id,
    user_id: user2.id
  }
]

bookings.each do |booking|
  Booking.create!(event_id: booking[:event_id], user_id: booking[:user_id])
end

puts "Created #{Booking.count} bookings"

puts "***SEED DONE***"
