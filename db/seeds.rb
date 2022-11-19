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

events.each do |event|
  Event.create!(title: event[:title], description: event[:description], start_date: event[:start_date],
                end_date: event[:end_date], location: event[:location], price: event[:price], category: event[:category],
                photo: event[:photo], user_id: event[:user_id], slot: event[:slot], contact: event[:contact])
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
