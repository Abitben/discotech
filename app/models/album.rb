class Album < ApplicationRecord
    has_many :copies
    has_many :users, through: :copies

    has_many :cartlines
    has_many :carts, through: :cartlines

    validates :title,  :artist, :year, :price, presence: true
end
