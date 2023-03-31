# frozen_string_literal: true

class AdsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @myads = @user.collections.where(for_sale: 1)
  end
end
