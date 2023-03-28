class AvatarsController < ApplicationController
  def create
    @user = current_user
    @user.avatar.attach(params[:avatar])
    redirect_to(user_path(@user))
  end
end
