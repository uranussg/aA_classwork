class ArtworksController < ApplicationController
  def index
    artworks = Artwork.where(artist_id: params[:user_id])
    render json: artworks
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def create
    artwork = Artwork.new(artwork_params)
    
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def update
    artwork = Artwork.find(params[:id])

    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    
    if artwork.delete
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def favorite
    artwork = Artwork.find(params[:id])

    status = (artwork.favorited ? false : true)
    artwork.update(favorited: status)
    render json: artwork
  end

  private

  def artwork_params
    params.require[:artwork].permit(:title, :img_url, :artist_id)
  end
end
