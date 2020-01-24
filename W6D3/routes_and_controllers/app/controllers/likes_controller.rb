class LikesController < ApplicationController
  def index
    if params.has_key?(:user_id)
      user = User.find_by(id: params[:user_id])
      render json: (user.liked_comments + user.liked_artworks)
    elsif params.has_key?(:artwork_id)
      artwork = Artwork.find_by(id: params[:artwork_id])
      render json: artwork.likers
    elsif params.has_key?(:comment_id)
      comment = Comment.find_by(id: params[:comment_id])
      render json: comment.likers
    end
  end

  def create
    like = Like.new(likes_params)
    if like.save
      render json: like
    else
      render json: like.errors.full_messages, status: 422
    end
  end

  def destroy
    like = Like.find(id: params[:id])
    if like.delete
      render json: like
    else
      render json: like.errors.full_messages, status: 422
    end
  end

  private

  def likes_params
    params.require[:likes].permit(:artwork_id, :user_id, :comment_id)
  end
end
