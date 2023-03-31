class AvatarsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    puts params[:user_id]
    @user.avatar.attach(params[:avatar])
    puts "hello world"
    redirect_to(user_path(@user))
  end
end
