class SubsController < ApplicationController

  def index
    @subs = Sub.all
  end
  def new
    @sub = Sub.new
    @sub.user_id = params[:user_id]
    render :new
  end

  def create
    @sub = Sub.create!(sub_params)
    if @sub 
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub.user_id == current_user.id 
      if @sub.update_attributes(sub_params)
        redirect_to sub_url(@sub)
      else 
        flash[:errors] = @sub.errors.full_messages
        render :edit
      end
    else
      flash[:errors] = ["Only moderator can edit a sub"]
      redirect_to sub_url 
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def sub_params
    params.require(:sub).permit(:title, :description, :user_id)
  end
  
end
