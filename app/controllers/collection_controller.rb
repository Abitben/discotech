class CollectionController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_collection = @user.collections.owned
  end
end
