class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
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
    @item = Item.find(params[:id])
  end



  private

  def item_params
    params.require(:item).permit(:item_name, :message, :price, :category_id, :item_status_id, :burden_id, :state_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end