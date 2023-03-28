class ReleasesController < ApplicationController
  def show
    @release = @wrapper.get_release(params[:id])
  end

  def index
  end
end
