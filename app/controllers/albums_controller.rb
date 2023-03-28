class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show edit update destroy ]

  # GET /albums or /albums.json
  def index
    @albums = Album.all.page(params[:page])
  end

  # GET /albums/1 or /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums or /albums.json
  def create
    @album = Album.new(album_params)

      if @album.save
          redirect_to album_url(@album), notice: "Album créé avec succès." 
      else
          render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /albums/1 or /albums/1.json
  def update
      if @album.update(album_params)
        redirect_to album_url(@album), notice: "Album modifié avec succès." 
      else
        render :edit, status: :unprocessable_entity 
        render json: @album.errors, status: :unprocessable_entity
      end
  end

  # DELETE /albums/1 or /albums/1.json
  def destroy
    @album.destroy
    redirect_to albums_url, notice: "Album supprimé." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:title, :artist, :year, :price)
    end
end
