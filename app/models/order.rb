# frozen_string_literal: true

class Order < ApplicationRecord
  after_create :order_send
  
  belongs_to :user
  belongs_to :cart

  def order_send
    UserMailer.confirmation_email(self.user, self).deliver_now
  end

end
