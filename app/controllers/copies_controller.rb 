class CopiesController < ApplicationController
  before_action :set_copy, only: %i[ show edit update destroy ]

  def index
    @collection = Copy.where(user_id: current_user)
  end

  def show
  end

  def edit
  end

  def create
    @copy = Copy.new(ad_params)
  end

  def update
      if @copy.update(ad_params)
        redirect_to copy_url(@copy), notice: "Ad was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @copy.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_copy
    @copy = Copy.find(params[:id])
  end

  def ad_params
    params.require(:copy).permit(:album_id, :user_id, :media_condition, :sleeve_condition, :status)
  end

end
