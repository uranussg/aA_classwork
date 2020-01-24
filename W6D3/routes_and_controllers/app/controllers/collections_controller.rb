class CollectionsController < ApplicationController

  def create
    collection = Collection.new(collection_params)
    
    if collection.save
      render json: collection
    else
      render json: collection.errors.full_messages, status: 422
    end
  end

  def destroy
    collection = Collection.find(params[:id])
    
    if collection.delete
      render json: collection
    else
      render json: collection.errors.full_messages, status: 422
    end
  end

  def show
    artworks = Artwork.joins(:collections).where("collections.title = '#{params[:id]}'")
    render json: artworks
  end

  def index
    collections = Collection.where(user_id: params[:user_id])
    render json: collections
  end


  def collection_params 
    params.require[:collection].permit(:title, :user_id, :artwork_id)
  end
end
