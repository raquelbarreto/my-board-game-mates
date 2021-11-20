require "open-uri"

Faker::Config.locale = 'en-GB'

User.destroy_all
Game.destroy_all
GameSession.destroy_all
UserReview.destroy_all
GameReview.destroy_all

# Create!s 20 regular users
20.times do |i|
  file = URI.open(Faker::Avatar.image(size: "100x100", format: "jpg"))
  gender = Faker::Gender.short_binary_type
  first_name = gender == 'm' ? Faker::Name.male_first_name : Faker::Name.female_first_name
  last_name = Faker::Name.last_name

  user = User.create!(
    email: "teste#{i + 1}@example.com",
    password: 123123,
    password_confirmation: 123123,
    about_me: Faker::TvShows::MichaelScott.quote,
    first_name: first_name,
    last_name: last_name,
    address: Faker::Address.full_address,
    age: rand(18..80),
    gender: gender
  )
  user.photo.attach(io: file, filename: 'user_avatar.jpg', content_type: 'image/jpg')
end

# Create! games
file = File.open("app/assets/images/games/catan.jpg")
catan = Game.create!(
  name: "Catan",
  description: "Catan whisks us back to the age of explorers; faced with an uninhabited island, players have to settle it before their opponents do. And because everyone's fighting to civilize the same frontier, clever manoeuvring is the order of the day. Foresight and good communication are rewarded too thanks to the island's limited resources, so this 1995 favorite is one of the best board games for players that want more of a challenge.",
  age_rating: "10+",
  player_count: 4,
  category: "Strategy",
  duration: 120
  # photo: Cloudinary::Uploader.upload("app/assets/images/games/catan.jpg")
)
catan.photo.attach(io: file, filename: 'game_catan.jpg', content_type: 'image/jpg')

file = File.open("app/assets/images/games/7wonders.jpg")
seven_wonders = Game.create!(
  name: "7 Wonders",
  description: "You are the leader of one of the 7 great cities of the Ancient World. Gather resources, develop commercial routes, and affirm your military supremacy. Build your city and erect an architectural wonder which will transcend future times.",
  age_rating: "10+",
  player_count: 7,
  category: "Strategy",
  duration: 30
)
seven_wonders.photo.attach(io: file, filename: '7wonders.jpg', content_type: 'image/jpg')

file = File.open("app/assets/images/games/betrayal_at_house_on_the_hill.jpg")
betrayal_hill = Game.create!(
  name: "Betrayal at House on the Hill",
  description: "Betrayal at House on the Hill quickly builds suspense and excitement as players explore a haunted mansion of their own design, encountering spirits and frightening omens that foretell their fate. With an estimated one hour playing time, Betrayal at House on the Hill is ideal for parties, family gatherings or casual fun with friends.",
  age_rating: "12+",
  player_count: 6,
  category: "Adventure",
  duration: 60
)
betrayal_hill.photo.attach(io: file, filename: 'betrayal_hill.jpg', content_type: 'image/jpg')


file = File.open("app/assets/images/games/carcassone.jpg")
carcassone = Game.create!(
  name: "Carcassone",
  description: "Carcassonne is a tile-placement game in which the players draw and place a tile with a piece of southern French landscape on it. The tile might feature a city, a road, a cloister, grassland or some combination thereof, and it must be placed adjacent to tiles that have already been played, in such a way that cities are connected to cities, roads to roads, etcetera.",
  age_rating: "7+",
  player_count: 5,
  category: "Strategy",
  duration: 45
)
carcassone.photo.attach(io: file, filename: 'carcassone.jpg', content_type: 'image/jpg')

file = File.open("app/assets/images/games/gloomhaven.jpg")
gloomhaven = Game.create!(
  name: "Gloomhaven",
  description: "Gloomhaven is a game of Euro-inspired tactical combat in a persistent world of shifting motives. Players will take on the role of a wandering adventurer with their own special set of skills and their own reasons for traveling to this dark corner of the world. Players must work together out of necessity to clear out menacing dungeons and forgotten ruins. In the process, they will enhance their abilities with experience and loot, discover new locations to explore and plunder, and expand an ever-branching story fueled by the decisions they make.",
  age_rating: "14+",
  player_count: 4,
  category: "Strategy",
  duration: 120
)
gloomhaven.photo.attach(io: file, filename: 'gloomhaven.jpg', content_type: 'image/jpg')

file = File.open("app/assets/images/games/pandemic.jpg")
pandemic = Game.create!(
  name: "Pandemic",
  description: "Wingspan is a competitive, medium-weight, card-driven, engine-building board game from Stonemaier Games. It's designed by Elizabeth Hargrave and features over 170 birds illustrated by Beth Sobel, Natalia Rojas, and Ana Maria Martinez.",
  age_rating: "8+",
  player_count: 4,
  category: "Strategy",
  duration: 45
)
pandemic.photo.attach(io: file, filename: 'pandemic.jpg', content_type: 'image/jpg')

file = File.open("app/assets/images/games/wingspan.jpg")
wingspan = Game.create!(
  name: "Wingspan",
  description: "With elegantly simple gameplay, Ticket to Ride can be learned in under 15 minutes. Players collect cards of various types of train cars they then use to claim railway routes in North America. The longer the routes, the more points they earn. Additional points come to those who fulfill Destination Tickets – goal cards that connect distant cities; and to the player who builds the longest continuous route.",
  age_rating: "10+",
  player_count: 5,
  category: "Strategy",
  duration: 70
  # photo: Cloudinary::Uploader.upload("app/assets/images/games/wingspan.jpg")
)
wingspan.photo.attach(io: file, filename: 'wingspan.jpg', content_type: 'image/jpg')

file = File.open("app/assets/images/games/ticket_to_ride.jpg")
ticket_to_ride = Game.create!(
  name: "Ticket to Ride",
  description: "With elegantly simple gameplay, Ticket to Ride can be learned in under 15 minutes. Players collect cards of various types of train cars they then use to claim railway routes in North America. The longer the routes, the more points they earn. Additional points come to those who fulfill Destination Tickets – goal cards that connect distant cities; and to the player who builds the longest continuous route.",
  age_rating: "8+",
  player_count: 5,
  category: "Strategy",
  duration: 60
  # photo: Cloudinary::Uploader.upload("app/assets/images/games/ticket_to_ride.jpg")
)
ticket_to_ride.photo.attach(io: file, filename: 'ticket_to_ride.jpg', content_type: 'image/jpg')

# Create! 15 sessions
15.times do
  user = User.find(User.pluck(:id).sample)
  game = Game.find(Game.pluck(:id).sample)
  apostrophe = user.first_name.end_with?("s") ? "'" : "'s"
  GameSession.create!(
    session_name: "#{user.first_name}#{apostrophe} #{game.name} night!",
    user: user,
    game: game,
    time: "20:00",
    date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    address: user.address,
    is_smoke_free: [true, false].sample,
    is_family_friendly: [true, false].sample,
    has_drinks: [true, false].sample,
    has_food: [true, false].sample,
    capacity: game.player_count,
    is_recurrent: [true, false].sample
  )
end

# For each game , create 5 reviews
games = Game.all

games.each do |game|
  5.times do
    user = User.find(User.pluck(:id).sample)
    GameReview.create!(
      user: user,
      game: game,
      rating: rand(1..5),
      content: Faker::Restaurant.review
    )
  end
end

# For each user, create 5 revies
users = User.all

users.each do |user|
  5.times do
    UserReview.create!(
      recepient: user,
      author: User.where("id != #{user.id}").sample,
      rating: rand(1..5),
      content: Faker::Restaurant.review
    )
  end
end
