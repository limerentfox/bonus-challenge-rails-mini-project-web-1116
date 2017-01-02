class BandsController < ApplicationController
  before_action :find_id, only: [:edit, :update, :destroy]

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.create(band_params)
    redirect_to bands_path
  end

  def show
    @band = Band.find(params[:id])
  end

  def edit
  end

  def update
    @band.update(band_params)
    redirect_to band_path(@band)
  end

  def destroy
    @band.destroy
    redirect_to bands_path
  end

  private

  def band_params
    params.require(:band).permit(:name, :website, :photo_url, :logo_url)
  end

  def find_id
    @band = Band.find(params[:id])
  end
end
