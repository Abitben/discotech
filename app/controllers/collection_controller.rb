class CollectionController < ApplicationController
  def index
  end

  def add_to_wishlist
    album = Album.create!(release_id: params[:release_id], image_url: params[:image_url], title: params[:title], artist: params[:artist], year: params[:year], price: Faker::Commerce.price(range: 0..50.0, as_string: true))
    Collection.create(user_id: current_user.id, album_id: album.id)
  end

  def add_to_collection
    album = Album.create!(release_id: params[:release_id], image_url: params[:image_url], title: params[:title], artist: params[:artist], year: params[:year], price: Faker::Commerce.price(range: 0..50.0, as_string: true))
    Collection.create(user_id: current_user.id, album_id: album.id, status: 1)
  end
end