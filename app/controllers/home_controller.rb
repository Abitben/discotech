class HomeController < ApplicationController
  def index
    @albums = Album.all
    @album_best_seller = Album.all.sample
    @best_sell = Album.all.sample
  end
end
