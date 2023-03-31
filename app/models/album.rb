class Album < ApplicationRecord
    paginates_per 10
    has_many :collections, dependent: :destroy
    has_many :users, through: :collections

    validates :title, :artist, :year, :price, presence: true
    validates :release_id, uniqueness: true
end
