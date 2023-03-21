# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# seed for albums table
10.times do
  Album.create!(
    title: Faker::Music.album,
    artist: Faker::Music.band,
    year: Faker::Number.between(from: 1950, to: 2023),
    price: Faker::Commerce.price(range: 0..50.0, as_string: true)
  )
end
puts "album is okay"

# seed for carts table
10.times do
  Cart.create!(
  )
end
puts "cart is okay"

# seed for users table
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    adress: Faker::Address.street_address,
    zip_code: Faker::Address.zip_code,
    city_name: Faker::Address.city,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 8),
  )
end
puts "user is okay"


# seed for orders table
10.times do
  Order.create!(
    user_id: Faker::Number.between(from: 1, to: 10),
    cart_id: Faker::Number.between(from: 1, to: 10),
  )
end
puts "order is okay"

# seed for cartlines table
10.times do
  Cartline.create!(
    album_id: Faker::Number.between(from: 1, to: 10),
    cart_id: Faker::Number.between(from: 1, to: 10),
  )
end
puts "cartline is okay"

# seed for collections table
10.times do
  Collection.create!(
    album_id: Faker::Number.between(from: 1, to: 10),
    user_id: Faker::Number.between(from: 1, to: 10),
  )
end
puts "cartline is okay"