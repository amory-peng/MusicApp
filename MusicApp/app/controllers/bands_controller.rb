class BandsController < ApplicationController
  before_action :verify_login

  def index
    current_user

    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    band = Band.new(band_params)
    if band.save
      redirect_to bands_url
    else
      redirect_to new_band_url
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
  end

  def update
    band = Band.find_by(id: params[:id])
    if band.update_attributes(band_params)
      redirect_to bands_url
    else
      redirect_to edit_band_url(band)
    end
  end

  def destroy
    band = Band.find_by(id: params[:id])
    band.destroy
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

  def verify_login
    redirect_to new_session_url unless logged_in?
  end
end
