class AlbumsController < ApplicationController

  before_action :verify_login

  def show
    @album = Album.find_by(id:params[:id])
    render :show
  end

  def new
    @band = Band.find_by(id: params[:band_id])
  end

  def create
    album = Album.new(album_params)
    if album.save
      redirect_to band_url(album_params[:band_id])
    else
      redirect_to new_band_album_url(album_params)
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
  end

  def update
    album = Album.find_by(id: params[:id])
    if album.update_attributes(album_params)
      redirect_to album_url(album)
    else
      redirect_to edit_album_url(album)
    end
  end

  def destroy
    album = Album.find_by(id: params[:id])
    album.destroy
    redirect_to band_url(album.band_id)
  end

  private

  def album_params
    params.require(:album).permit(:name, :studio, :band_id)
  end
end
