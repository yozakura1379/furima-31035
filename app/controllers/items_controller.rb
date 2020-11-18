class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # これでこのアクションにはログインが必要になる
  before_action :set_item, only: [:edit, :update, :destroy, :show]
  before_action :prohibit_access, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
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
    @item = Item.find(params[:id])
    @like = Like.new
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def edit
    if  @item.user_id != current_user.id 
      redirect_to root_path
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
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

  def prohibit_access
    redirect_to action: :show if @item.user_id != current_user.id
  end

end




