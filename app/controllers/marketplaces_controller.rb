class MarketplacesController < ApplicationController
  def index
    @collections = Collection.all.page(params[:page])
  end

  def show
  end
end
