class PostsController < ApplicationController
  before_action :require_logged_in
  def new
    @post = Post.new
    @post.user_id = params[:user_id]
    # debugger
    @subs = Sub.all
    render :new
  end

  def create
    @post = Post.new(title: post_params[:title], content: post_params[:content],
    user_id: post_params[:user_id], url: post_params[:url])
    debugger
    if !post_params[:subs]
      flash[:error] = ["has to select at least one sub!"]
      @subs = Sub.all
      render :new
    end


    if @post.save
      post_params[:subs].each do |sub|
        PostSub.create(post_id: @post.id, sub_id: sub.to_i)
      
      end
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end

  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post && @post.user_id == current_user.id
      if @post.update_attributes(post_params)
        redirect_to post_url(@post)
      else 
        flash[:errors] = @post.errors.full_messages
        render :edit
      end
    else 
      flash[:errors] = ["you can only edit your own posts"]
      redirect_to post_url(@post)
    end
  end
  

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post && @post.user_id == current_user.id  
      @post.destroy
      redirect_to user_url(current_user)
    else 
      flash[:errors] = ["only users or moderators can delete!"]
      redirect_to sub_url(@post.sub_id)
    end

  end

  def show
     @post = Post.find_by(id: params[:id]) 
     render :show
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id, subs: [] )
  end

end
