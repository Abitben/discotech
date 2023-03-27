class Cartline < ApplicationRecord
  belongs_to :ad
  belongs_to :cart
  # belongs_to :order
end
