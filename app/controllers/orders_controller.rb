class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: params[:user_id])
  end
end
