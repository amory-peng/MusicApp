class TracksController < ApplicationController

  before_action :verify_login

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def new
    @album = Album.find_by(id: params[:album_id])
  end

  def create
    track = Track.new(track_params)
    if track.save
      redirect_to track_url(track)
    else
      new_album_track(track_params)
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
  end

  def update
    track = Track.find_by(id: params[:id])
    if track.update_attributes(track_params)
      redirect_to track_url(track)
    else
      redirect_to edit_track(track)
    end
  end

  def destroy
    track = Track.find_by(id: params[:id])
    track.destroy
    redirect_to album_url(track[:album_id])
  end

  private

  def track_params
    params.require(:track).permit(:title, :album_id, :lyrics)
  end

end
