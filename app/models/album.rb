class Album < ApplicationRecord
    paginates_per 10
    has_many :collections
    has_many :users, through: :collections

    has_many :cartlines
    has_many :carts, through: :cartlines

    validates :title,  :artist, :year, :price, presence: true
end
