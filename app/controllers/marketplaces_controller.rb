class MarketplacesController < ApplicationController
  def index
    @collections = Collection.where(for_sale: true) 
    @ads = Kaminari.paginate_array(@collections.to_a).page(params[:page]).per(5)
  end

  def show
    @collection = Collection.find(params[:id])
  end
end