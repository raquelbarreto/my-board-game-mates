# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  user1 = User.create(
    first_name: "John",
    last_name: "Doe",
    about_me: "I love playing games and drinking wine!",
    address: "SQN 410 bloco T",
    age: 48,
    gender: "male",
    email: "johndoe@gmail.com",
    password: 123123,
    password_confirmation: 123123
  )

  game1 = Game.create(
    name: "Catan",
    description: "Fun for the whole family",
    age_rating: "10+",
    player_count: 4,
    category: "strategy",
    duration: 40
  )

  session1 = Session.create(
    game: game1,
    user: user1,
    date: "10/01/1992",
    time: "23:00:00"
  )

  user2 = User.create(
    email: "a@a.com",
    password: 123123,
    password_confirmation: 123123
  )

  lobby1 = Lobby.create(
    session: session1,
    user: user2,
    available: true
  )

  gamereview1 = GameReview.create(
    game: game1,
    user: user2,
    rating: 4,
    content: "happy times!"
  )

  user_review1 = UserReview.create(
    recepient: user1,
    author: user2,
    rating: 2,
    content: "very boring person."
  )
