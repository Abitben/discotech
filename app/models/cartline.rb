class Cartline < ApplicationRecord
  belongs_to :collection
  belongs_to :cart
  # belongs_to :order
end
