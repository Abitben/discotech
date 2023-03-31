# frozen_string_literal: true

class CollectionController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_collection = @user.collections.owned.where.not(for_sale: 2)
  end

  def add_to_wishlist
    album = Album.create!(release_id: params[:release_id], image_url: params[:image_url], title: params[:title],
                          artist: params[:artist], year: params[:year], price: Faker::Commerce.price(range: 0..50.0, as_string: true))
    Collection.create(user_id: current_user.id, album_id: album.id)
    redirect_to user_wishlist_index_path(current_user.id)
  end

  def remove_from_wishlist
    @collection = Collection.find_by(user_id: params[:user_id], album_id: params[:album_id])
    @collection.destroy
    redirect_to user_wishlist_index_path(current_user.id)
  end

  def add_to_collection
    album = Album.create!(release_id: params[:release_id], image_url: params[:image_url], title: params[:title],
                          artist: params[:artist], year: params[:year], price: Faker::Commerce.price(range: 0..50.0, as_string: true))
    Collection.create(user_id: current_user.id, album_id: album.id, status: 1)
    redirect_to user_collection_index_path(current_user.id)
  end

  def remove_from_collection
    @collection = Collection.find_by(user_id: params[:user_id], album_id: params[:album_id])
    @collection.destroy
    redirect_to user_collection_index_path(current_user.id)
  end

  def sell_owned_album
    @collection = Collection.find_by(user_id: params[:user_id], album_id: params[:album_id])
    @collection.update!(for_sale: 1)
    redirect_to user_ads_path(current_user.id)
  end

  def unsell_owned_album
    @collection = Collection.find_by(user_id: params[:user_id], album_id: params[:album_id])
    @collection.update!(for_sale: 0)
    redirect_to user_ads_path(current_user.id)
  end
end
