class CollectionController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    user_copies = Copy.where(user_id: @user.id)
    @owned = user_copies.owned 
  end
end
