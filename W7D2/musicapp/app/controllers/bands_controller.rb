class BandsController < ApplicationController

  def index
    @bands = Band.all  
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show

  end

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      #log_in!(@user)
      redirect_to bands_url
    else   
      render json: @band.errors.full_messages
    end
  end

  def edit 
    @band = Band.find(params[:id])
    render :edit
    
  end
  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      #log_in!(@user)
      redirect_to band_url(@band)
    else   
      render json: @band.errors.full_messages
    end
  end

  def band_params
    params.require(:band).permit(:name)
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end
end
