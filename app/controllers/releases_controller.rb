class ReleasesController < ApplicationController
  def show
    @release = @wrapper.get_release(params[:id])
  end

  def index
  end

  def search
    search = @wrapper.search(params[:id], :per_page => 50, :type => :release)
    @results = Kaminari.paginate_array(search.results.to_a).page(params[:page]).per(5)
  end
end
