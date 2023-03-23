class Cartline < ApplicationRecord
  belongs_to :album
  belongs_to :cart
  # belongs_to :order, optional: true
end
