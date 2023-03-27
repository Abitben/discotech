class Album < ApplicationRecord
    has_many :copies
    has_many :users, through: :copies
    
    validates :title,  :artist, :year, :price, presence: true
end
