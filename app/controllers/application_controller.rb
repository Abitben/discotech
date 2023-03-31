# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_discogs_wrapper
  include ApplicationHelper

  before_action :current_cart

  private

  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    return unless session[:cart_id].nil?

    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id
  end

  def set_discogs_wrapper
    @wrapper = Discogs::Wrapper.new('Test OAuth', user_token: 'paamjOrFUPostpOgjjwwmrJmYQOJkqEiTWUkONpe')
  end
end
