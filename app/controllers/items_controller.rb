class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:create, :show, :edit, :update]
  before_action :redirect_root, only: [:edit]
  def index
    @items = Item.order(created_at: "DESC")
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

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end



  private

  def item_params
    params.require(:item).permit(:item_name, :message, :price, :category_id, :item_status_id, :burden_id, :state_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

  def redirect_root
    if @item.user_id == !current_user.id || !@item.order.nil?
      redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:id])
  end
end