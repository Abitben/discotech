class Cart < ApplicationRecord
    has_many :cartlines, dependent: :destroy
    has_many :albums, through: :cartlines
    has_one :order

end
