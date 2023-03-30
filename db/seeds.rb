# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'discogs'
wrapper = Discogs::Wrapper.new("Test OAuth", user_token: "paamjOrFUPostpOgjjwwmrJmYQOJkqEiTWUkONpe")

10.times do
  
 release = wrapper.get_release(rand(1..10000))
  unless release.message == 'Release not found.'
    Album.create!(
      release_id: release.id,
      image_url: release.images[0].uri,
      title: release.title,
      artist: release.artists[0].name,
      year: release.year,
      price: Faker::Commerce.price(range: 0..50.0, as_string: true)
    )
  end
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
    address: Faker::Address.street_address,
    zip_code: Faker::Address.zip_code,
    city_name: Faker::Address.city,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 6, max_length: 20, mix_case: true, special_characters: true) + "#{rand(1..50)}"
  )
end

User.create(email: "admin@discotech.com", password: "Admin@THPforUser75", is_admin: true)
puts "user is okay"



# seed for collections table
10.times do
  Collection.create!(
    album_id: Album.all.sample.id,
    user_id: User.all.sample.id,
    sleeve_condition: rand(1..10),
    media_condition: rand(1..10),
    status: rand(0..1),
    for_sale: Faker::Boolean.boolean(true_ratio: 0.4)
  )
end

puts "collection is okay"

# seed for cartlines table
10.times do
  Cartline.create!(
    collection_id: Collection.all.sample.id,
    cart_id: Cart.all.sample.id,
  )
end
puts "cartline is okay"


# seed for orders table
10.times do
  Order.create!(
    user_id: User.all.sample.id,
    cart_id: Cart.all.sample.id,
  )
end
puts "order is okay"
