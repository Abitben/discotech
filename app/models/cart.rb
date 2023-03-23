class Cart < ApplicationRecord
    has_many :cartlines, dependent: :destroy
    has_many :albums, through: :cartlines
    has_one :order

    def sub_total
        sum = 0
        self.cartlines.each do |cartline|
          sum+= cartline.album.price
        end
        return sum
    
    end

end
