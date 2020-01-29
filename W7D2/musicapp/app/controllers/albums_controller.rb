class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    render :edit    
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)

      redirect_to album_url(@album)

    else
      render json: @album.errors.full_messages  
    end
  end

  def new
    @album = Album.new
    @album.band_id = params[:band_id]
    render :new 
  end

  def create
    @album = Album.new(params[:id])
    if @album.update(album_params)
      debugger
      redirect_to album_url(@album.id)
    else
      render json: @album.errors.full_messages  
    end
  end

  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end


end
