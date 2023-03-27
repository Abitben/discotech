class Ad < ApplicationRecord
  has_many :cartlines
  has_many :carts, through: :cartlines
  belongs_to :copy

  enum :status, { draft: 0, online: 1, sold: 2, down: 3 }

end
