class CartsController < ApplicationController
  def show
    @cart = @current_cart
    @cartlines = @cart.cartlines
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to albums_path
  end

  def price
    @price = @cart.sub_total
  end
end
