class CheckoutController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_completed?

  def create
    @total = params[:total].to_d
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        },
      ],
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    redirect_to @session.url, allow_other_host: true
  end
  
  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @order = Order.create!(user_id: current_user.id, cart_id: @current_cart.id)
    create_entry_collection_for_buyer(@order)
    update_entry_collection_for_seller(@order)
    update_cart
  end
  
  def cancel
  end

  def create_entry_collection_for_buyer(order)
    order.cart.collections.each do |collection|
      Collection.create!(user_id: current_user.id, album_id: collection.album.id, sleeve_condition: collection.sleeve_condition, media_condition: collection.media_condition, status: 1)
    end
  end

  def update_entry_collection_for_seller(order)
    order.cart.collections.each do |collection|
      collection.vendu!
    end
  end

  def update_cart
    session[:cart_id] = nil
    current_cart
  end

end
