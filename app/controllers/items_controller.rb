class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] #これでこのアクションにはログインが必要になる
  before_action :set_item, only: [:edit, :update, :destroy, :show]
  


  def index
    @items = Item.order(created_at: :DESC).includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def destroy
      
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :about, :category_id, :status_id, :delivery_fee_id, :days_id, :prefecture_id).merge(user_id: current_user.id)
  end


  def set_item
  @item = Item.find(params[:id])
  end
end