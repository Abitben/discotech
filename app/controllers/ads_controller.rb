class AdsController < ApplicationController
  def index
    @user = User.find(params[:user_id]) 
    @myads = @user.collections.where(for_sale: true)
  end
end
