class WishlistController < ApplicationController
  def index
    @wished = find_user_copies.wished 
  end
end
