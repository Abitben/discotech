class WishlistController < ApplicationController
  def index
    wish = Collection.where(user_id: params[:user_id])
    @wished_albums = wish.wished
  end
end
