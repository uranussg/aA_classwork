class CommentsController < ApplicationController
  
  before_action :require_logged_in, except: :show
  
  def new
    @comment = Comment.new
    @comment.post_id = params[:post_id]
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    debugger
    if @comment.save 
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end

  end

  def show
    @comment = Comment.find_by(id: params[:id])

    if @comment 
      render :show
    else
      flash[:errors] = ["no such comment"]
      redirect_to user_url(current_user) 
    end

  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id, :parent_comment_id)
  end

end
