class Cart < ApplicationRecord
    has_many :cartlines
    has_many :albums, through: :cartlines

    has_one :order
end
