class CatsController < ApplicationController
  before_action :check_cats_belong_current_user, only: [:edit]

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    # cat_params[:user_id] = current_user.id #not sure if we can add :user_id by ourselves
    @cat = Cat.new(cat_params, user_id: current_user.id)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    #@cat was created inside the check_cats_belong_current_user
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def check_cats_belong_current_user
    @cat = Cat.find_by(id: params[:id])
    return if current_user.cats.pluck(:id).include?(params[:id]) 
    @cat[errors][:user_id] << "not owner, can't edit cat" #hopefully this works
  end 

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
