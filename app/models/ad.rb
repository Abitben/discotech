class Ad < ApplicationRecord
  has_many :cartlines
  has_many :carts, through: :cartlines
  belongs_to :copy
end
