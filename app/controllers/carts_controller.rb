# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @cart = @current_cart
    @cartlines = @cart.cartlines
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to cart_path
  end
end
