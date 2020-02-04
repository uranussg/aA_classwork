class AlbumsController < ApplicationController
  before_action :require_log_in
  # def index
    
  #   @albums = Album.where(band_id: params[:band_id])
  #   # debugger
  #   render :index
  # end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.all
    render :edit    
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)

      redirect_to album_url(@album)

    else
      falsh[:errors] = @album.errors.full_messages
      redirect_to album_url(@album)  
    end
    
  end

  def new
    @album = Album.new
    @bands = Band.all
    @album.band_id = params[:band_id]
    render :new 
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      debugger
      redirect_to album_url(@album.id)
    else
      flash[errors] = @album.errors.full_messages  
      redirect_to band_url(@album.band_id)
    end
  end

  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end


end
