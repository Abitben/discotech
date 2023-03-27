class WishlistController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    user_copies = Copy.where(user_id: @user.id)
    @wished = user_copies.wished 
  end
end
