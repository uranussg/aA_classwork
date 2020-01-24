class ArtworkSharesController < ApplicationController
  def create
    artwork_share = ArtworkShare.new(artwork_shares_params)
    if artwork_share.save
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork_share = ArtworkShare.find(id: params[:id])
    if artwork_share.delete
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages, status: 422
    end
  end

  # def favorite
  #   artworkshare = ArtworkShare.find(params[:id])

  #   status = (artworkshare.favorited ? false : true)
  #   artworkshare.update(favorited: status)
  #   render json: artworkshare
  # end


  private

  def artwork_shares_params
    params.require[:artwork_shares].permit(:artwork_id, :viewer_id)
  end
end
