class CommentsController < ApplicationController
  
  before_action :require_logged_in, except: :show
  
  def new
    @comment = Comment.new
    @comment.post_id = params[:post_id]
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    # debugger
    if @comment.save 
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end

  end

  def show
    @comment = Comment.find_by(id: params[:id])

    # if @comment 
    #   render :show
    # else
    #   flash[:errors] = ["no such comment"]
    #   redirect_to user_url(current_user) 
    # end

  end

  def edit
    @comment = current_user.comments.find(params[:id])
    if @comment
      render :edit
    else 
      flash[:errors] =["you can only edit your own comment"]
      render comment_url(params[:id])
    end

  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update
      redirect_to comment_url(@comment)
    else 
      flash[:errors] = @comment.errors.full_messages
      redirect_to comment_url(@comment)
    end
  
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    if @comment
      @comment.destroy
      redirect_to user_url(current_user)
    else 
      flash[:errors] = ["You can only delete your own comment"]
      redirect_to comment_url(params[:id])
    end
  end


  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id, :parent_comment_id)
  end

end
