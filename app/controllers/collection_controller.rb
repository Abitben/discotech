class CollectionController < ApplicationController
  def index
    @owned = find_user_copies.owned 
  end
end
