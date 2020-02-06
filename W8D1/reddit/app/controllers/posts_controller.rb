class PostsController < ApplicationController
  before_action :require_logged_in, expet: :show
  def new
    @post = Post.new
    @post.user_id = params[:user_id]
    # debugger
    @subs = Sub.all
    render :new
  end

  def create
    # @post = Post.new(title: post_params[:title], content: post_params[:content],
    # user_id: post_params[:user_id], url: post_params[:url])
    debugger
    @post = Post.new(post_params)
    # if @post.subs.empty?
    #   flash[:error] = ["has to select at least one sub!"]
    #   debugger
    #   @subs = Sub.all
    #   render :new
    # end


    if @post.save
      debugger
      # @post.sub_ids = post_params[:sub_ids].map(&:to_i)
      # post_params[:subs].each do |sub|
      #   PostSub.create(post_id: @post.id, sub_id: sub.to_i)
      
      # end
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      debugger
      
      rendirect_to new_user_post_url
    end

  end

  def edit
    @post = Post.find_by(id: params[:id])
    @subs = Sub.all
    render :edit
  end

  def update
    @post = Post.find_by(id: params[:id])
    debugger
    if @post && @post.user_id == current_user.id
      if @post.update(post_params)
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
      redirect_to post_url(@post)
    end

  end

  def show
     @post = Post.find_by(id: params[:id]) 
     render :show
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id, sub_ids: [] )
  end

end
