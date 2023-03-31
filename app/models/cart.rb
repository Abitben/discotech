# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cartlines, dependent: :destroy
  has_many :collections, through: :cartlines
  has_one :order

  def sub_total
    sum = 0
    cartlines.each do |cartline|
      sum += cartline.collection.album.price
    end
    sum
  end
end
