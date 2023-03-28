class HomeController < ApplicationController
  def index
    @release = @wrapper.get_release(params[:id])
  end
end
