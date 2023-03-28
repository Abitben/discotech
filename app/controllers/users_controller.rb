class UsersController < ApplicationController
  include UsersHelper
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :is_admin?, only: %i[ index ]
  before_action :verify_user?, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all.page(params[:page])
  end

  # GET /users/1 or /users/1.json
  def show
    @albums = @user.albums
    @orders = Order.where(user_id: @user.id)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to user_url(@user), notice: "Utilisateur créé avec succès."
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
      if @user.update(user_params)
        redirect_to user_url(@user), notice: "Utilisateur édité avec succès." 
      else
        render :edit, status: :unprocessable_entity 
      end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    redirect_to users_url, notice: "Utilisateur supprimé." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :address, :zip_code, :city_name, :country, :phone)
    end
end
