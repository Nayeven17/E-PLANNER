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
    location: "Les Ruines de Balaclava, Balaclava",
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
    location: "Château de Labourdonnais, Mapou",
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
    location: "Le Domaine de St Aubin, St Aubin",
    price: 1_800,
    category: "Festival",
    slot: 350,
    contact: "sunburn@festival.com",
    image_url: "https://images.unsplash.com/photo-1567942712661-82b9b407abbf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    user_id: user1.id
  },
  {
    title: "Dave Brown - Acoustic Tour",
    description: "Dave Brown, the famous British artist will be here to make you rediscover his last album in an
    intimate setting",
    start_date: Date.new(2022, 11, 14),
    end_date: Date.new(2022, 11, 14),
    location: "The Irish, Trianon",
    price: 1_000,
    category: "Concert",
    slot: 80,
    contact: "davebrown@acoustictour.com",
    image_url: "https://images.unsplash.com/photo-1534014003122-b516fbde05d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    user_id: user2.id
  },
  {
    title: "New Year's Eve at Château de Labourdonnais",
    description: "Come and party with your friends and family at Le Chateau de Labourdonnais for a unique and festive
    New Year! Open buffet all night long and fireworks to end the night beautifully!",
    start_date: Date.new(2022, 12, 31),
    end_date: Date.new(2022, 12, 31),
    location: "Château de Labourdonnais, Mapou",
    price: 2_500,
    category: "Festival",
    slot: 400,
    contact: "reservations@lcdlb.com",
    image_url: "https://images.unsplash.com/photo-1535379665706-aea78de84a41?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    user_id: user1.id
  },
  {
    title: "Le Cirque de L'Aurore",
    description: "Le Cirque de l'Aurore est de retour à Maurice, avec encore plus d'artistes à découvrir! Réservez-vite
    vos places et venez profiter de ce moment magique en famille et entre amis!",
    start_date: Date.new(2022, 12, 15),
    end_date: Date.new(2022, 12, 26),
    location: "Bagatelle Mall, Moka",
    price: 1_000,
    category: "Spectacle",
    slot: 350,
    contact: "reservations@lcda.com",
    image_url: "https://images.unsplash.com/photo-1558894656-499bef76ce48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80",
    user_id: user2.id
  },
  {
    title: "Mauritius Flower Festival 2022",
    description: "For the first time in Mauritius, discover the Flower Festival 2022, with the most beaufilly flowered
    parade you've ever seen! Dress up in your most flowery outfit and join us to celebrate together!",
    start_date: Date.new(2022, 11, 28),
    end_date: Date.new(2022, 11, 28),
    location: "Caudan Waterfront, Port Louis",
    price: 1_200,
    category: "Festival",
    slot: 500,
    contact: "flowerfest@flfestival.com",
    image_url: "https://images.unsplash.com/photo-1634820491179-03ae219ff58b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    user_id: user1.id
  },
  {
    title: "Sunset Party 2022",
    description: "Sea, Sun and Sand ! Our local artists  and DJS will make you vibe till the end of the night! Unlimited
    drinks, photobooth and tropical buffet will be available. Get your tickets now! ",
    start_date: Date.new(2022, 11, 27),
    end_date: Date.new(2022, 11, 27),
    location: "The Ravenala Attitude Hotel, Balaclava",
    price: 2_000,
    category: "Festival",
    slot: 200,
    contact: "reservations@ravenala.com",
    image_url: "https://images.unsplash.com/photo-1559494007-9f5847c49d94?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    user_id: user2.id
  },
  {
    title: "Twelve and A Half by Gary Veee",
    description: "Gary Vee, CEO of VaynerX and 5-Times NYT bestseller will be in Mauritius as part of his tour for his
    new book 'Twelve and A Half. Don't miss this once in a lifetime opportunity and get yout tickets now! ",
    start_date: Date.new(2022, 12, 4),
    end_date: Date.new(2022, 12, 4),
    location: "J&J Auditorium, Vacoas",
    price: 2_800,
    category: "Conference",
    slot: 500,
    contact: "garyveeteam@vee.com",
    image_url: "https://images.unsplash.com/photo-1546872006-42c78c0ccb29?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
    user_id: user1.id
  },
  {
    title: "Orchestre Philharmonique de Vienne - Concert de Noel",
    description: "Le Conservatoire National a le plaisir de vous inviter à un concert de Noel par l'Orchestre
    Philharmonique de Vienne, dirigé par le célèbre chef d'orchestre David Cohen ! Réservez vos place au plus vite!",
    start_date: Date.new(2022, 12, 27),
    end_date: Date.new(2022, 12, 27),
    location: "Caudan Arts Center, Port Louis",
    price: 1_200,
    category: "Concert",
    slot: 400,
    contact: "events@rezo.com",
    image_url: "https://images.unsplash.com/photo-1617544517234-c436b0624a34?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    user_id: user2.id
  },
  {
    title: "Chinese Festival 2023 at Le Domaine de Labourdonnais",
    description: "Celebrate Chinese New Year at Le DOmaine de Labourdonnais with your family and friends. Discover a
    selection of traditional Chinese dishes and desserts and get ready for an evening full of surprises! ",
    start_date: Date.new(2023, 2, 4),
    end_date: Date.new(2023, 2, 4),
    location: "Le Domaine de Labourdonnais, Mapou",
    price: 1_000,
    category: "Festival",
    slot: 300,
    contact: "contact@ldl.com",
    image_url: "https://images.unsplash.com/photo-1553343030-f3b3292c43d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    user_id: user2.id
  },
  {
    title: "African Night",
    description: "Vous voulez passer un moment agréable en famille ou entre amis? Ça tombe bien! L'African Night ne vous
     décevra pas! Au sommaire: 6 artistes venu tout droit du continent Africain qui vous feront valser au son des
     instruments traditionnels. Reservez-vite vos places pour nous rejoindre!",
    start_date: Date.new(2022, 12, 22),
    end_date: Date.new(2022, 12, 22),
    location: "The Irish, Trianon",
    price: 1_100,
    category: "Concert",
    slot: 200,
    contact: "africannight@afromusic.com",
    image_url: "https://images.unsplash.com/photo-1571951178107-b061c6ae01aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
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
