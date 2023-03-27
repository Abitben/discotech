class Copy < ApplicationRecord
  enum :status, { whished: 0, owned: 1}
  
  
  belongs_to :album
  belongs_to :user

end
